//
//  FeaturedPlaylistsResponse.swift
//  Spotify
//
//  Created by Eddy Donald Chinchay Lujan on 23/12/22.
//

import Foundation

// MARK: - FeaturedPlaylistResponse
struct FeaturedPlaylistResponse: Codable {
    let message: String
    let playlists: PlaylistsResponse
}

// MARK: - PlaylistsResponse
struct PlaylistsResponse: Codable {
    let href: String
    let items: [Playlist]
    let limit: Int
    let next: String
    let offset: Int
    let previous: String?
    let total: Int
}



// MARK: - Owner
struct User: Codable {
    let displayName: String
    let externalUrls: ExternalUrls
    let href: String
    let id, type, uri: String

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case externalUrls = "external_urls"
        case href, id, type, uri
    }
}
