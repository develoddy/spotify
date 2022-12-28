// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let playlistDetailsResponse = try? newJSONDecoder().decode(PlaylistDetailsResponse.self, from: jsonData)

import Foundation

// MARK: - PlaylistDetailsResponse
struct PlaylistDetailsResponse: Codable {
    let description: String?
    let externalUrls: ExternalUrls?
    let href: String?
    let id: String?
    let images: [APIImage]?
    let name: String?
    let primaryColor: String?
    let playlistPublic: Bool?
    let tracks: PlaylistsTracksResponse?
    let type, uri: String?

    enum CodingKeys: String, CodingKey {
        case description = "description"
        case externalUrls = "external_urls"
        case href, id, images, name
        case primaryColor = "primary_color"
        case playlistPublic = "public"
        case tracks
        case type, uri
    }
}

// MARK: - PlaylistsTracksResponse
struct PlaylistsTracksResponse: Codable {
    let href: String?
    let items: [PlaylistItem]? //[AudioTrack]? //[Item]
    let limit: Int?
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int?
}


// MARK: - PlaylistItem
struct PlaylistItem: Codable {
    let track: AudioTrack?

    enum CodingKeys: String, CodingKey {
        case track
    }
}
