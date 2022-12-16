//
//  YoutubeSearchReponse.swift
//  iOTT
//
//  Created by zs-mac-3 on 28/11/22.
//

import Foundation



struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
