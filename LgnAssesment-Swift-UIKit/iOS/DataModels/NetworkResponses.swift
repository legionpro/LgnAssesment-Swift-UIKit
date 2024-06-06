//
//  NetworkResponses.swift
//  iOS
//
//  Created by Oleh Poremskyy on 05.06.2024.
//

import Foundation

// MARK: - the Types for describing the real data from network Get

import Foundation

struct ColectionObjects: Codable {
  var elapsedMilliseconds : Int?          = nil
  var count               : Int?          = nil
  var countFacets         : CountFacets?  = CountFacets()
  var artObjects          : [ArtObjects]? = []
  //var facets              : [Facets]?     = []

  enum CodingKeys: String, CodingKey {
    case elapsedMilliseconds = "elapsedMilliseconds"
    case count               = "count"
    case countFacets         = "countFacets"
    case artObjects          = "artObjects"
    //case facets              = "facets"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    elapsedMilliseconds = try values.decodeIfPresent(Int.self          , forKey: .elapsedMilliseconds )
    count               = try values.decodeIfPresent(Int.self          , forKey: .count               )
    countFacets         = try values.decodeIfPresent(CountFacets.self  , forKey: .countFacets         )
    artObjects          = try values.decodeIfPresent([ArtObjects].self , forKey: .artObjects          )
    //facets              = try values.decodeIfPresent([Facets].self     , forKey: .facets              )
 
  }

  init() {

  }

}
