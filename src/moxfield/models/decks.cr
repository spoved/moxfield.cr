module Moxfield::Types
  alias Decks = Array(Deck)

  struct Deck
    include JSON::Serializable
    property id : String
    property name : String
    property description : String
    property format : String
    property visibility : String
    @[JSON::Field(key: "publicUrl")]
    property public_url : String
    @[JSON::Field(key: "publicId")]
    property public_id : String
    @[JSON::Field(key: "likeCount")]
    property like_count : Int32
    @[JSON::Field(key: "viewCount")]
    property view_count : Int32
    @[JSON::Field(key: "commentCount")]
    property comment_count : Int32
    @[JSON::Field(key: "areCommentsEnabled")]
    property are_comments_enabled : Bool
    @[JSON::Field(key: "isShared")]
    property is_shared : Bool
    @[JSON::Field(key: "authorsCanEdit")]
    property authors_can_edit : Bool
    @[JSON::Field(key: "createdByUser")]
    property created_by_user : CreatedByUser
    property authors : Array(CreatedByUser)
    @[JSON::Field(key: "requestedAuthors")]
    property requested_authors : Array(CreatedByUser)
    property main : Card
    @[JSON::Field(key: "mainboardCount")]
    property mainboard_count : Int32
    property mainboard : Hash(String, Entry)
    @[JSON::Field(key: "sideboardCount")]
    property sideboard_count : Int32
    property sideboard : Hash(String, Entry)
    @[JSON::Field(key: "maybeboardCount")]
    property maybeboard_count : Int32
    property maybeboard : Hash(String, Entry)
    @[JSON::Field(key: "commandersCount")]
    property commanders_count : Int32
    property commanders : Hash(String, Entry)
    @[JSON::Field(key: "companionsCount")]
    property companions_count : Int32
    property companions : Hash(String, Entry)
    @[JSON::Field(key: "attractionsCount")]
    property attractions_count : Int32
    property attractions : Hash(String, Entry)
    @[JSON::Field(key: "stickersCount")]
    property stickers_count : Int32
    property stickers : Hash(String, Entry)
    property version : Int32
    @[JSON::Field(key: "signatureSpellsCount")]
    property signature_spells_count : Int32
    @[JSON::Field(key: "signatureSpells")]
    property signature_spells : Hash(String, Entry)
    property tokens : Array(Card)
    property hubs : Array(Hub)
    @[JSON::Field(key: "createdAtUtc")]
    property created_at_utc : String
    @[JSON::Field(key: "lastUpdatedAtUtc")]
    property last_updated_at_utc : String
    @[JSON::Field(key: "exportId")]
    property export_id : String
    @[JSON::Field(key: "authorTags")]
    property author_tags : Hash(String, Array(String))
    @[JSON::Field(key: "isTooBeaucoup")]
    property is_too_beaucoup : Bool

    struct Entry
      include JSON::Serializable
      property quantity : Int32
      @[JSON::Field(key: "boardType")]
      property board_type : String
      property finish : String
      @[JSON::Field(key: "isFoil")]
      property is_foil : Bool
      @[JSON::Field(key: "isAlter")]
      property is_alter : Bool
      @[JSON::Field(key: "isProxy")]
      property is_proxy : Bool
      property card : Card
      @[JSON::Field(key: "useCmcOverride")]
      property use_cmc_override : Bool
      @[JSON::Field(key: "useManaCostOverride")]
      property use_mana_cost_override : Bool
      @[JSON::Field(key: "useColorIdentityOverride")]
      property use_color_identity_override : Bool
    end
  end
end
