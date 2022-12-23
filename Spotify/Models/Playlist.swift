//
//  Playlist.swift
//  Spotify
//
//  Created by Eddy Donald Chinchay Lujan on 20/12/22.
//

import Foundation

// MARK: - Item
struct Playlist: Codable {
    let collaborative: Bool
    let itemDescription: String
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
    let type, uri: String

    enum CodingKeys: String, CodingKey {
        case collaborative
        case itemDescription = "description"
        case externalUrls = "external_urls"
        case href, id, images, name, owner
        case type, uri
    }
}
