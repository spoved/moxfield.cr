module Moxfield
  alias Cards = Array(Card)

  struct Card
    include JSON::Serializable
    property id : String
    @[JSON::Field(key: "uniqueCardId")]
    property unique_card_id : String
    property scryfall_id : String
    property set : String
    property set_name : String
    property name : String
    property cn : String
    property layout : String
    property cmc : Float32
    @[JSON::Field(key: "type")]
    property _type : String?
    property type_line : String
    property oracle_text : String?
    property mana_cost : String?
    property colors : Array(String)
    property color_indicator : Array(JSON::Any?)
    property color_identity : Array(String)
    property legalities : Legalities
    property frame : String
    property reserved : Bool
    property digital : Bool
    property foil : Bool
    property nonfoil : Bool
    property etched : Bool
    property glossy : Bool
    property rarity : String
    property border_color : String
    property colorshifted : Bool
    property lang : String
    property latest : Bool
    property has_multiple_editions : Bool
    property has_arena_legal : Bool
    property prices : Prices
    property card_faces : Array(CardFace)
    property artist : String
    property promo_types : Array(String)
    @[JSON::Field(key: "cardHoarderUrl")]
    property card_hoarder_url : String?
    @[JSON::Field(key: "cardKingdomUrl")]
    property card_kingdom_url : String?
    @[JSON::Field(key: "cardMarketUrl")]
    property card_market_url : String?
    @[JSON::Field(key: "tcgPlayerUrl")]
    property tcg_player_url : String?
    @[JSON::Field(key: "isArenaLegal")]
    property is_arena_legal : Bool
    property released_at : String
    property multiverse_ids : Array(Int32)?
    property cardmarket_id : Int32?
    property tcgplayer_id : Int32?
    property cardkingdom_id : Int32?
    property reprint : Bool
    property set_type : String
    @[JSON::Field(key: "isToken")]
    property is_token : Bool
    @[JSON::Field(key: "defaultFinish")]
    property default_finish : String
    property loyalty : String?
    @[JSON::Field(key: "cardKingdomFoilUrl")]
    property card_kingdom_foil_url : String?
    property edhrec_rank : Int32?
    property mtgo_id : Int32?
    property arena_id : Int32?
    property cardkingdom_foil_id : Int32?
    @[JSON::Field(key: "coolStuffIncUrl")]
    property cool_stuff_inc_url : String?
    @[JSON::Field(key: "coolStuffIncFoilUrl")]
    property cool_stuff_inc_foil_url : String?
    property power : String?
    property toughness : String?
    property flavor_text : String?
    property frame_effects : Array(String)?
  end
end
