//
//  Segment.swift
//  AppleTVTest
//
//  Created by Keanu Freitas on 6/5/18.
//  Copyright © 2018 Keanu Freitas. All rights reserved.
//

import Foundation

class Segment {
    
    let id: Int
    let name: String
    let position: Int
    let createdAt, updatedAt: String
    let learnableID: Int
    let videoURL: String
    let duration, chapterID: Int
    let wistiaHashedID: String
    
    init(id: Int, name: String, createdAt: String, updatedAt: String, position: Int, learnableID: Int, videoURL: String, duration: Int, chapterID: Int, wistiaHashedID: String) {
        
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.position = position
        self.learnableID = learnableID
        self.videoURL = videoURL
        self.duration = duration
        self.chapterID = chapterID
        self.wistiaHashedID = wistiaHashedID
    }
}
