require "halite"
require "spoved/logger"
require "db/pool"
require "./models/*"
require "compress/gzip"

class Moxfield::Api
  API_SCHEME           = "https"
  API_HOST             = "api2.moxfield.com"
  API_CARD_SEARCH_PATH = "/v2/cards/search"
  API_DECK_SEARCH_PATH = "/v2/decks/search"
  API_HEADERS          = HTTP::Headers{
    "User-Agent"   => "PostmanRuntime/7.31.1",
    "Content-Type" => "application/json; charset=utf-8",
  }

  # This is a constant that defines the value for sorting by "updated".
  SORT_UPDATED = "updated"

  # This is an enumeration that defines the valid types of sorting.
  enum SortType
    Updated
    Created
    Views
    Likes
    Comments
  end

  # This is a constant that defines the value for sorting in descending order.
  SORT_DES = "Descending"

  # This is a constant that defines the value for sorting in ascending order.
  SORT_ASC = "Ascending"
end

require "./api/*"

class Moxfield::Api
  extend Moxfield::Api::Search
  extend Moxfield::Api::Decks

  class Error < Exception
    getter resp : RespObject? = nil

    def initialize(resp : RespObject)
      @resp = resp
      @message = resp.details
    end

    class ConnectionLost < ::DB::PoolResourceLost(HTTP::Client); end

    class NotFound < Error; end

    struct RespObject
      include JSON::Serializable
      getter object : String
      getter code : String
      getter status : Int32
      getter details : String

      def initialize(@object, @code, @status, @details); end
    end
  end

  record Options, pool_capacity = 200, initial_pool_size = 20, pool_timeout = 0.1, sleep_time = 0.1

  @@sleep_time : Float64 = 0.0
  @@pool : DB::Pool(HTTP::Client) = DB::Pool(HTTP::Client).new do
    HTTP::Client.new(URI.new(scheme: API_SCHEME, host: API_HOST))
  end

  def self.configure(options : Options = Options.new, &block)
    yield options
    configure(options)
  end

  def self.configure(options : Options = Options.new)
    @@sleep_time = options.sleep_time
    @@pool = DB::Pool(HTTP::Client).new(max_pool_size: options.pool_capacity, initial_pool_size: options.initial_pool_size, checkout_timeout: options.pool_timeout) do
      HTTP::Client.new(URI.new(scheme: API_SCHEME, host: API_HOST))
    end
  end

  spoved_logger

  # URI helper function
  def self.make_request_uri(path : String, params : String | Nil = nil) : URI
    URI.new(path: path, query: params)
  end

  # Make a request with a string URI
  def self.make_request(path : String, params : String | Nil = nil)
    make_request(make_request_uri(path, params))
  end

  # Make a request with a URI object
  def self.make_request(uri : URI)
    sleep(@@sleep_time) if @@sleep_time > 0
    logger.debug { "GET: #{uri}" }
    using_connection do |client|
      resp = client.get(uri.to_s, headers: API_HEADERS)
      if resp.success?
        resp.body
      elsif resp.status_code == 404
        raise Error::NotFound.new(Error::RespObject.new(
          uri.to_s, resp.status_code.to_s, resp.status_code, resp.body
        ))
      else
        raise Error.new(Error::RespObject.new(
          uri.to_s, resp.status_code.to_s, resp.status_code, resp.body
        ))
      end
    end
  end

  private def self.using_connection
    @@pool.retry do
      @@pool.checkout do |conn|
        yield conn
      rescue ex : IO::Error | IO::TimeoutError
        logger.error { ex.message }
        logger.trace(exception: ex) { ex.message }
        raise Error::ConnectionLost.new(conn)
      end
    end
  end
end
