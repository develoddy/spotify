//
//  SettingsModels.swift
//  Spotify
//
//  Created by Eddy Donald Chinchay Lujan on 22/12/22.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
