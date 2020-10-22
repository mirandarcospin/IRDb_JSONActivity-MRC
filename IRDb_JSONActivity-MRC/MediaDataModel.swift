//
//  MediaDataModel.swift
//  IRDb_JSONActivity-MRC
//
//  Created by Miranda Ramirez Cospin on 10/22/20.
//

import UIKit

class MediaDataModel: Codable {
    var franchise: [Franchise] = []
}

class Franchise: Codable{
    let franchiseName: String
    let entries: [Entry]
}

class Entry: Codable{
    let name: String
    let format: String
    let yearStart: String
    let yearEnd: String?
    let empisode: Int?
    let studio: String?
    let network: String?
    let imageURL: String
    let description: String
    let summary: String
    let starring: [Cast]
}

class Cast: Codable{
    let actorName: String
    let role: String 
}
