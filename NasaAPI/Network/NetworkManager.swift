//
//  NetworkManager.swift
//  NasaAPI
//
//  Created by Adriano Rodrigues Vieira on 24/11/22.
//

import Foundation

enum MiscError: Error {
    case genericError
    case noData
    case corruptedData
    case badUrl
}

struct NetworkManager {
    func getData(completion: @escaping (Result<PictureOfDayDataModel, Error>) -> Void) {
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=" + Constants.API_KEY

        guard let url = URL(string: urlString) else {
            completion(.failure(MiscError.badUrl))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
            } else {
                if let data {
                    do {
                        let decoded = try JSONDecoder().decode(PictureOfDayDataModel.self, from: data)
                        completion(.success(decoded))
                    } catch {
                        completion(.failure(MiscError.corruptedData))
                    }
                } else {
                    completion(.failure(MiscError.noData))
                }
            }
        }.resume()
    }
}
