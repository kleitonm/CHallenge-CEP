//
//  HomeService.swift
//  LeardingAPI
//
//  Created by Kleiton Mendes on 01/07/24.
//viacep.com.br/ws/01001000/json/

import Foundation

protocol HomeServiceProtocolTwo {
    func fetchDataTwo(cep: String, completion: @escaping(Result<DataModel, Error>) -> Void)
}

final class HomeServiceTwo {
    
    private let baseURL: String = "https://viacep.com.br/ws/"
}

extension HomeServiceTwo: HomeServiceProtocolTwo {
    func fetchDataTwo(cep: String, completion: @escaping (Result<DataModel, any Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)\(cep)/json") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
            }
            guard let data,
                  let response = response as? HTTPURLResponse else { return }
            if (200..<300).contains(response.statusCode) {
                do {
                    let jsonResponse = try JSONDecoder().decode(DataModel.self, from: data)
                    completion(.success(jsonResponse))
                } catch {
                    completion(.failure(error))
                    }
                }
            
            }
        task.resume()
        }
    }



protocol HomeServiceProtocol {
    func fetchData(cep: String, completion: @escaping(Result<DataModel, Error>) -> Void)
    func didFetchData()
}

final class HomeService {
    private let baseURL: String = "https://viacep.com.br/ws/"
}

extension HomeService: HomeServiceProtocol {
    func fetchData(cep: String, completion: @escaping(Result<DataModel, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)\(cep)/json/") else { return } 
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
            }
            guard let data else { return }
            guard let response = response as? HTTPURLResponse else { return }
            if (200..<300).contains(response.statusCode) {
                do {
                    let jsonReponse = try JSONDecoder().decode(DataModel.self, from: data)
                    completion(.success(jsonReponse))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func didFetchData() {
        
    }
    
}
