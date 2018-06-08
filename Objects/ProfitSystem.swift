//
//  ProfitSystem.swift
//  AppleTVTest
//
//  Created by Keanu Freitas on 6/4/18.
//  Copyright © 2018 Keanu Freitas. All rights reserved.
//

import Foundation
import UIKit

class ProfitSystem: NSObject {

    let title: String
    let cover: String
    let learnID: Int
    let desc: String
    let segments: [Segment]

    init(title: String, cover: String, learnID: Int, desc: String, segments: [Segment]) {
        self.title = title
        self.cover = cover
        self.learnID = learnID
        self.desc = desc
        self.segments = segments
    }
}
