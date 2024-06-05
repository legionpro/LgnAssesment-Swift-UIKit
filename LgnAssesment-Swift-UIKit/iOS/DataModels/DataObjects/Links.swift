
import Foundation

struct Links: Codable {

  var self0 : String? = nil
  var web0  : String? = nil

  enum CodingKeys: String, CodingKey {

    case self0 = "self"
    case web0  = "web"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    self0 = try values.decodeIfPresent(String.self , forKey: .self0 )
    web0  = try values.decodeIfPresent(String.self , forKey: .web0  )
 
  }

  init() {

  }

}
