//
//  main.swift
//  Sprint1
//
//  Created by Ismael Sabri Pérez on 16/1/25.
//

import Foundation
import OSLog

let logger = Logger(subsystem: "Sprint1", category: "main")

// MARK: - Main
func main() {
    
    let songs = SongsLoader().songs

    songs.forEach { song in
        print(song.basicInfo.title)
    }
    
}

main()


