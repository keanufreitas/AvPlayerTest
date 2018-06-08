//
//  DecodingData.swift
//  AppleTVTest
//
//  Created by Keanu Freitas on 6/5/18.
//  Copyright © 2018 Keanu Freitas. All rights reserved.
//

import Foundation
import UIKit

extension MoviesCollectionCollectionViewController {
    
    // MARK: CourseElement
    struct CourseElement: Codable {
        let id: Int
        let name, description, createdAt, updatedAt: String
        let coverArtFileName: String
        let coverArtFileSize: Int
        let coverArtUpdatedAt: String
        let metaBackgroundColor, metaFontColor, metaBackgroundImageFileName: String
        let metaBackgroundImageUpdatedAt, sku: String
        let releaseDate: String
        
        enum CodingKeys: String, CodingKey {
            case id, name, description
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case coverArtFileName = "cover_art_file_name"
            case coverArtFileSize = "cover_art_file_size"
            case coverArtUpdatedAt = "cover_art_updated_at"
            case metaBackgroundColor = "meta_background_color"
            case metaFontColor = "meta_font_color"
            case metaBackgroundImageFileName = "meta_background_image_file_name"
            case metaBackgroundImageUpdatedAt = "meta_background_image_updated_at"
            case sku
            case releaseDate = "release_date"
        }
    }
    
    // MARK: Segment
    struct SegmentDecode: Codable {
        let id: Int
        let name: String
        let position: Int
        let createdAt, updatedAt: String
        let learnableID: Int
        let videoURL, jwplayerMediaID: String
        let duration, chapterID: Int
        let wistiaHashedID: String
        
        enum CodingKeys: String, CodingKey {
            case id, name, position
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case learnableID = "learnable_id"
            case videoURL = "video_url"
            case jwplayerMediaID = "jwplayer_media_id"
            case duration
            case chapterID = "chapter_id"
            case wistiaHashedID = "wistia_hashed_id"
        }
    }
    
    // MARK: Encode/decode helpers
    class JSONNull: Codable {
        public init() {}
        
        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }
}
