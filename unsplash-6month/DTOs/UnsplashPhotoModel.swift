//
//  UnsplashPhotoModel.swift
//  unsplash-6month
//
//  Created by Telegey Nurbekova on 17/08/24.
//

import Foundation

struct UnsplashPhoto: Codable {
    let id: String
    let urls: URLS
    let user: User
    
    struct URLS: Codable {
        let small: String
    }
    
    struct User: Codable {
        let name: String
    }
}
