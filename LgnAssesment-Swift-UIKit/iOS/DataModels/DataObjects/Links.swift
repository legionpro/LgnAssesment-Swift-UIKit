
import Foundation

struct Links: Codable {

  var sself : String? = nil
  var wweb  : String? = nil

  enum CodingKeys: String, CodingKey {

    case sself = "self"
    case wweb  = "web"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    sself = try values.decodeIfPresent(String.self , forKey: .sself )
    wweb  = try values.decodeIfPresent(String.self , forKey: .wweb  )
 
  }

  init() {

  }

}
