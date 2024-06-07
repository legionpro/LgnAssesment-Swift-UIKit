
import Foundation

struct Facets: Codable {

  var facets     : [Facets]? //= []
  var name       : String? //  = nil
  var otherTerms : Int?    //  = nil
  var prettyName : Int?    //  = nil

  enum CodingKeys: String, CodingKey {

    case facets     = "facets"
    case name       = "name"
    case otherTerms = "otherTerms"
    case prettyName = "prettyName"
  
  }

//  init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)//
//    facets     = try values.decodeIfPresent([Facets].self , forKey: .facets     )
//    name       = try values.decodeIfPresent(String.self   , forKey: .name       )
//    otherTerms = try values.decodeIfPresent(Int.self      , forKey: .otherTerms )
//    prettyName = try values.decodeIfPresent(Int.self      , forKey: .prettyName )
// 
//  }
//
//  init() {
//
//  }

}
