//
//  LibraryAlbumsResponse.swift
//  Spotify
//
//  Created by Eddy Donald Chinchay Lujan on 3/1/23.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [AlbumItems] //[AlbumItems] //[Album]
}


struct AlbumItems: Codable {
    let album: Album
}
