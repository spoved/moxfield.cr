module Moxfield::Types
  struct CreatedByUser
    include JSON::Serializable

    @[JSON::Field(key: "userName")]
    property user_name : String
    @[JSON::Field(key: "profileImageUrl")]
    property profile_image_url : String?
    property badges : Array(String)
  end

  struct Hub
    include JSON::Serializable
    property name : String
    property description : String
  end

  struct CardFace
    include JSON::Serializable
    property id : String
    property name : String
    property mana_cost : String
    property type_line : String
    property oracle_text : String
    property colors : Array(String)
    property color_indicator : Array(String)
    property flavor_text : String?
  end

  struct Legalities
    include JSON::Serializable
    property standard : String?
    property future : String?
    property historic : String?
    property gladiator : String?
    property pioneer : String?
    property explorer : String?
    property modern : String?
    property legacy : String?
    property pauper : String?
    property vintage : String?
    property penny : String?
    property commander : String?
    property brawl : String?
    property historicbrawl : String?
    property alchemy : String?
    property paupercommander : String?
    property duel : String?
    property oldschool : String?
    property premodern : String?
    property predh : String?
  end

  struct Prices
    include JSON::Serializable
    property usd : Float64?
    property eur : Float64?
    property ck : Float64?
    @[JSON::Field(key: "lastUpdatedAtUtc")]
    property last_updated_at_utc : String
    property ck_buy : Float64?
    property ck_buy_qty : Int32?
    property usd_foil : Float64?
    property eur_foil : Float64?
    property tix : Float64?
    property ck_foil : Float64?
    property csi : Float64?
    property csi_buy : Float64?
    property csi_buy_qty : Int32?
    property ck_buy_foil : Float64?
    property csi_foil : Float64?
    property csi_buy_foil : Float64?
    property ck_buy_foil_qty : Int32?
    property csi_buy_foil_qty : Int32?
  end
end
