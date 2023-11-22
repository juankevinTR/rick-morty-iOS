//
//  NetworkServiceImpl.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

class NetworkServiceImpl: NetworkService {
    func executeRequest<T: APIRequest>(request: T, completion: @escaping (Result<T.Response, Error>) -> Void) {
        let requestURL = request.baseURL.appendingPathComponent(request.urlPathComponent)
        var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)

        if !request.urlParameters.isEmpty {
            urlComponents?.queryItems = request.urlParameters.map {
                URLQueryItem(name: $0, value: $1 )
            }
        } else {
            urlComponents?.queryItems = nil
        }

        guard let finalURL = urlComponents?.url else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }

        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = request.headers

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.Response.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        })

        task.resume()
    }
}
