//
//  AudioTrack.swift
//  Spotify
//
//  Created by Eddy Donald Chinchay Lujan on 20/12/22.
//

import Foundation

struct AudioTrack: Codable {
    let album: Album?
    let artist: [Artist]?
    let availableMarkets: [String]?
    let discNumber: Int?
    let durationMs: Int?
    let explicit: Bool?
    let externalUrls: ExternalUrls?
    let href, id, name: String?
    let popularity: Int?
    
    enum CodingKeys: String, CodingKey {
        case album
        case artist
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationMs = "duration_ms"
        case explicit
        case externalUrls = "external_urls"
        case href, id, name
        case popularity
    }
}
