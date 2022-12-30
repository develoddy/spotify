//
//  Artist.swift
//  Spotify
//
//  Created by Eddy Donald Chinchay Lujan on 20/12/22.
//

import Foundation

struct Artist: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let id, name, type, uri: String

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, name, type, uri
    }
}
