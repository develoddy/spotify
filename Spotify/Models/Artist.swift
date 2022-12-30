//
//  Artist.swift
//  Spotify
//
//  Created by Eddy Donald Chinchay Lujan on 30/12/22.
//

import Foundation

struct Artist: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let images: [APIImage]?
    let id, name, type, uri: String

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case images
        case href, id, name, type, uri
    }
}
