import Foundation

struct AlbumDetailsResponse: Codable {
    let albumType: String?
    let artists: [Artist]?
    let availableMarkets: [String]?
    let externalUrls: ExternalUrls?
    let id: String?
    let images: [APIImage]?
    let label: String?
    let tracks: TracksResponse?
    /*let type, uri: String?*/

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case artists
        case availableMarkets = "available_markets"
        case externalUrls = "external_urls"
        case id, images, label
        case tracks
        /*case tracks, type, uri*/
    }
}

// MARK: - TracksResponse
struct TracksResponse: Codable {
    let href: String?
    let items: [AudioTrack]? //[Item]
    let limit: Int?
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int?
}








// MARK: - Artist
/*struct Artist: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let id, name: String
    let type: ArtistType
    let uri: String

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, name, type, uri
    }
}*/


// MARK: - Item
/*struct Item: Codable {
    let artists: [Artist]
    let availableMarkets: [String]
    let discNumber, durationMS: Int
    let explicit: Bool
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let isLocal: Bool
    let name: String
    let previewURL: String
    let trackNumber: Int
    let type: ItemType
    let uri: String

    enum CodingKeys: String, CodingKey {
        case artists
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationMS = "duration_ms"
        case explicit
        case externalUrls = "external_urls"
        case href, id
        case isLocal = "is_local"
        case name
        case previewURL = "preview_url"
        case trackNumber = "track_number"
        case type, uri
    }
}*/
