//
//  NetworkService.swift
//  unsplash-6month
//
//  Created by Telegey Nurbekova on 17/08/24.
//

import Foundation
import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchUnsplashPhotos(completion: @escaping ([PhotoDetails]?) -> Void) {
        let accessKey = "jWl4NZuJWwE-exFn49zd1SNZ9qS7Se4bOXBEUsN0j3A"
        let urlString = "https://api.unsplash.com/photos?client_id=\(accessKey)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let unsplashPhotos = try JSONDecoder().decode([UnsplashPhoto].self, from: data)
                let photoDetails = unsplashPhotos.map { photo in
                    PhotoDetails(imageUrl: photo.urls.small, artistName: photo.user.name)
                }
                completion(photoDetails)
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?, CGFloat, CGFloat) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, 0, 0)
                return
            }
            
            if let image = UIImage(data: data) {
                let width = image.size.width
                let height = image.size.height
                completion(image, width, height)
            } else {
                completion(nil, 0, 0)
            }
        }.resume()
    }
}
