//
//  NetworkingService.swift
//  Adopet
//
//  Created by Gustavo Ferreira dos Santos on 27/08/24.
//

import Foundation

enum NetworkingError: Error {
    case networkError(Error)
    case dataUnavailable
    case decodingError(Error)
    case urlUnavailable
}

protocol NetworkingProtocol {
    func request<T: Decodable>(_ url: URL, completion: @escaping ((Result<T, NetworkingError>) -> Void))
}

class UrlSessionNetworking: NetworkingProtocol {
    func request<T>(_ url: URL, completion: @escaping ((Result<T, NetworkingError>) -> Void)) where T : Decodable {
        URLSession.shared.dataTask(with: url) { (responseData, _, error) in
            if let error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = responseData else {
                completion(.failure(.dataUnavailable))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}

class AlamoFireNetworking: NetworkingProtocol {
    func request<T>(_ url: URL, completion: @escaping ((Result<T, NetworkingError>) -> Void)) where T : Decodable {
        print("Requisição com alamofire")
    }
}
