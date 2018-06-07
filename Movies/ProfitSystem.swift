//
//  ProfitSystem.swift
//  AppleTVTest
//
//  Created by Keanu Freitas on 6/4/18.
//  Copyright © 2018 Keanu Freitas. All rights reserved.
//

import Foundation

class ProfitSystem {

    let title: String
    let cover: String
    let learnID: Int
    let segments: [Segment]

    init(title: String, cover: String, learnID: Int, segments: [Segment]) {
        self.title = title
        self.cover = cover
        self.learnID = learnID
        self.segments = segments
    }
}
