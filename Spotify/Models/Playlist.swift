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
    let itemDescription: String?
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
/*
{
    collaborative = 0;
    description = "<null>";
    "external_urls" =     {
        spotify = "https://open.spotify.com/playlist/5QUO1uCanLKlyICDy6bWtl";
    };
    followers =     {
        href = "<null>";
        total = 0;
    };
    href = "https://api.spotify.com/v1/playlists/5QUO1uCanLKlyICDy6bWtl";
    id = 5QUO1uCanLKlyICDy6bWtl;
    images =     (
    );
    name = "eddy regue";
    owner =     {
        "display_name" = "Eddy Luj\U00e1n";
        "external_urls" =         {
            spotify = "https://open.spotify.com/user/31vzwqvhb25ssdvfxdl7zr42iyji";
        };
        href = "https://api.spotify.com/v1/users/31vzwqvhb25ssdvfxdl7zr42iyji";
        id = 31vzwqvhb25ssdvfxdl7zr42iyji;
        type = user;
        uri = "spotify:user:31vzwqvhb25ssdvfxdl7zr42iyji";
    };
    "primary_color" = "<null>";
    public = 1;
    "snapshot_id" = MSxjMjliMGEwYjRlMTE0MmZlNmQzN2U0NmFiMzkzZDk5Nzc3MzczOTE5;
    tracks =     {
        href = "https://api.spotify.com/v1/playlists/5QUO1uCanLKlyICDy6bWtl/tracks";
        items =         (
        );
        limit = 100;
        next = "<null>";
        offset = 0;
        previous = "<null>";
        total = 0;
    };
    type = playlist;
    uri = "spotify:playlist:5QUO1uCanLKlyICDy6bWtl";
}
*/
