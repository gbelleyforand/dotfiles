#!/usr/bin/swift

import Foundation
import MediaPlayer

let center = MPNowPlayingInfoCenter.default()

if let info = center.nowPlayingInfo {
    let title = info[MPMediaItemPropertyTitle] as? String ?? ""
    let artist = info[MPMediaItemPropertyArtist] as? String ?? ""
    
    if !title.isEmpty {
        if !artist.isEmpty {
            print("\(title) – \(artist)")
        } else {
            print(title)
        }
    }
}

