module Moxfield::Types
  struct DeckDatum
    include JSON::Serializable

    @[JSON::Field(key: "matchTypes")]
    property match_types : Array(String) = Array(String).new
    @[JSON::Field(key: "matchedCards")]
    property matched_cards : Array(String) = Array(String).new
    property id : String
    property name : String
    @[JSON::Field(key: "hasPrimer")]
    property has_primer : Bool
    property format : String
    @[JSON::Field(key: "areCommentsEnabled")]
    property are_comments_enabled : Bool
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
    @[JSON::Field(key: "isLegal")]
    property is_legal : Bool
    @[JSON::Field(key: "authorsCanEdit")]
    property authors_can_edit : Bool
    @[JSON::Field(key: "isShared")]
    property is_shared : Bool
    @[JSON::Field(key: "mainCardId")]
    property main_card_id : String
    @[JSON::Field(key: "mainCardIdIsCardFace")]
    property main_card_id_is_card_face : Bool
    @[JSON::Field(key: "createdByUser")]
    property created_by_user : CreatedByUser
    property authors : Array(CreatedByUser)
    @[JSON::Field(key: "createdAtUtc")]
    property created_at_utc : String
    @[JSON::Field(key: "lastUpdatedAtUtc")]
    property last_updated_at_utc : String
    @[JSON::Field(key: "mainboardCount")]
    property mainboard_count : Int32
    @[JSON::Field(key: "sideboardCount")]
    property sideboard_count : Int32
    @[JSON::Field(key: "maybeboardCount")]
    property maybeboard_count : Int32
    @[JSON::Field(key: "hubNames")]
    property hub_names : Array(String)
  end
end
