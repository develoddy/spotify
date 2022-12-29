//
//  SearchResult.swift
//  Spotify
//
//  Created by Eddy Donald Chinchay Lujan on 29/12/22.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
