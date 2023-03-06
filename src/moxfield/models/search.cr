module Moxfield
  struct SearchDatum
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
    property datum_type : String
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
    property flavor_text : String?
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
    property edhrec_rank : Int32?
    property multiverse_ids : Array(Int32)?
    property cardmarket_id : Int32?
    property mtgo_id : Int32?
    property tcgplayer_id : Int32?
    property cardkingdom_id : Int32?
    property reprint : Bool
    property set_type : String
    @[JSON::Field(key: "isToken")]
    property is_token : Bool
    @[JSON::Field(key: "defaultFinish")]
    property default_finish : String
    property power : String?
    property toughness : String?
    @[JSON::Field(key: "coolStuffIncUrl")]
    property cool_stuff_inc_url : String?
    @[JSON::Field(key: "cardKingdomFoilUrl")]
    property card_kingdom_foil_url : String?
    property arena_id : Int32?
    property cardkingdom_foil_id : Int32?
    property loyalty : String?
    @[JSON::Field(key: "coolStuffIncFoilUrl")]
    property cool_stuff_inc_foil_url : String?
    property frame_effects : Array(String)?

    struct CardFace
      include JSON::Serializable

      property id : String
      property name : String
      property mana_cost : String
      property type_line : String
      property oracle_text : String
      property colors : Array(String)
      property color_indicator : Array(String)
      property power : String?
      property toughness : String?
      property flavor_text : String?
    end

    struct Legalities
      include JSON::Serializable

      property standard : String
      property future : String
      property historic : String
      property gladiator : String
      property pioneer : String
      property explorer : String
      property modern : String
      property legacy : String
      property pauper : String
      property vintage : String
      property penny : String
      property commander : String
      property brawl : String
      property historicbrawl : String
      property alchemy : String
      property paupercommander : String
      property duel : String
      property oldschool : String
      property premodern : String
      property predh : String
    end

    struct Prices
      include JSON::Serializable
      property usd : Float64?
      property eur : Float64?
      property tix : Float64?
      property ck : Float64?
      @[JSON::Field(key: "lastUpdatedAtUtc")]
      property last_updated_at_utc : String
      property ck_buy : Float64?
      property csi : Float64?
      property csi_buy : Float64?
      property usd_foil : Float64?
      property eur_foil : Float64?
      property ck_foil : Float64?
      property ck_buy_foil : Float64?
      property csi_foil : Float64?
      property csi_buy_foil : Float64?
      property ck_buy_foil_qty : Int32?
      property ck_buy_qty : Int32?
      property csi_buy_qty : Int32?
      property csi_buy_foil_qty : Int32?
    end
  end
end
