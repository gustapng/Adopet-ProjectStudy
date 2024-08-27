//
//  ImageDownloader.swift
//  Adopet
//
//  Created by Gustavo Ferreira dos Santos on 26/08/24.
//

import Foundation

class ImageDownloader {
    func downloadImage(from url: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                completion(data)
            }
        }.resume()
    }
}
