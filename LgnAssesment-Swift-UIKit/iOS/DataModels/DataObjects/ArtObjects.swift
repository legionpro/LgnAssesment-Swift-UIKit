
import Foundation

struct ArtObjects: Codable {

  var links                 : Links?       = Links()
  var id                    : String?      = nil
  var objectNumber          : String?      = nil
  var title                 : String?      = nil
  var hasImage              : Bool?        = nil
  var principalOrFirstMaker : String?      = nil
  var longTitle             : String?      = nil
  var showImage             : Bool?        = nil
  var permitDownload        : Bool?        = nil
  var webImage              : WebImage?    = WebImage()
  var headerImage           : HeaderImage? = HeaderImage()
  var productionPlaces      : [String]?    = []

  enum CodingKeys: String, CodingKey {

    case links                 = "links"
    case id                    = "id"
    case objectNumber          = "objectNumber"
    case title                 = "title"
    case hasImage              = "hasImage"
    case principalOrFirstMaker = "principalOrFirstMaker"
    case longTitle             = "longTitle"
    case showImage             = "showImage"
    case permitDownload        = "permitDownload"
    case webImage              = "webImage"
    case headerImage           = "headerImage"
    case productionPlaces      = "productionPlaces"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    links                 = try values.decodeIfPresent(Links.self       , forKey: .links                 )
    id                    = try values.decodeIfPresent(String.self      , forKey: .id                    )
    objectNumber          = try values.decodeIfPresent(String.self      , forKey: .objectNumber          )
    title                 = try values.decodeIfPresent(String.self      , forKey: .title                 )
    hasImage              = try values.decodeIfPresent(Bool.self        , forKey: .hasImage              )
    principalOrFirstMaker = try values.decodeIfPresent(String.self      , forKey: .principalOrFirstMaker )
    longTitle             = try values.decodeIfPresent(String.self      , forKey: .longTitle             )
    showImage             = try values.decodeIfPresent(Bool.self        , forKey: .showImage             )
    permitDownload        = try values.decodeIfPresent(Bool.self        , forKey: .permitDownload        )
    webImage              = try values.decodeIfPresent(WebImage.self    , forKey: .webImage              )
    headerImage           = try values.decodeIfPresent(HeaderImage.self , forKey: .headerImage           )
    productionPlaces      = try values.decodeIfPresent([String].self    , forKey: .productionPlaces      )
 
  }

  init() {

  }

}