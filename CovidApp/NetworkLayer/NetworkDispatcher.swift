//
//  NetworkDispatcher.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 21/01/2021.
//

import Foundation

class NetworkDispatcher {
    class func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> ()) {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path =  endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let session = URLSession(configuration: .default)
        NetworkLogger.log(request: urlRequest)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard  response != nil, let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(responseObject))
                } catch let error {
                    completion(.failure(error))
                }
            }
            if let httpResponse = response as? HTTPURLResponse {
                NetworkLogger.log(response: httpResponse, data: data, error: error)
            }
        }
        dataTask.resume()
    }
}
