import Foundation

/*
 Podemos ver que los 4 son diferentes y queremos un solo tipo que pueda encapsular
 */
struct SearchResultsResponse: Codable {
    let albums: SearchAlbumsResponse
    let artists: SearchArtistsResponse
    let tracks: SearchTracksResponse
    let playlists: SearchPlaylistsResponse
}

// MARK: - Albums
struct SearchAlbumsResponse: Codable {
    let items: [Album]
}

// MARK: - Artists
struct SearchArtistsResponse: Codable {
    let items: [Artist]
}

// MARK: - Playlists
struct SearchPlaylistsResponse: Codable {
    let items: [Playlist]
}

// MARK: - Tracks
struct SearchTracksResponse: Codable {
    let items: [AudioTrack]
}
