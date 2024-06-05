
import Foundation

struct WebImage: Codable {

  var guid              : String? = nil
  var offsetPercentageX : Int?    = nil
  var offsetPercentageY : Int?    = nil
  var width             : Int?    = nil
  var height            : Int?    = nil
  var url               : String? = nil

  enum CodingKeys: String, CodingKey {

    case guid              = "guid"
    case offsetPercentageX = "offsetPercentageX"
    case offsetPercentageY = "offsetPercentageY"
    case width             = "width"
    case height            = "height"
    case url               = "url"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    guid              = try values.decodeIfPresent(String.self , forKey: .guid              )
    offsetPercentageX = try values.decodeIfPresent(Int.self    , forKey: .offsetPercentageX )
    offsetPercentageY = try values.decodeIfPresent(Int.self    , forKey: .offsetPercentageY )
    width             = try values.decodeIfPresent(Int.self    , forKey: .width             )
    height            = try values.decodeIfPresent(Int.self    , forKey: .height            )
    url               = try values.decodeIfPresent(String.self , forKey: .url               )
 
  }

  init() {

  }

}