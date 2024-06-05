
import Foundation

struct CountFacets: Codable {

  var hasimage  : Int? = nil
  var ondisplay : Int? = nil

  enum CodingKeys: String, CodingKey {

    case hasimage  = "hasimage"
    case ondisplay = "ondisplay"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    hasimage  = try values.decodeIfPresent(Int.self , forKey: .hasimage  )
    ondisplay = try values.decodeIfPresent(Int.self , forKey: .ondisplay )
 
  }

  init() {

  }

}