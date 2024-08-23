//
//  HomeViewModel.swift
//  LeardingAPI
//
//  Created by Kleiton Mendes on 01/07/24.
//

import Foundation

protocol HomeViewModelProtocol {
  func handleData(cep: String, completion: @escaping(Result<DataModel, Error>) -> Void)
  func fetchData()
}

final class HomeViewModel {
    private let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func handleData(cep: String, completion: @escaping (Result<DataModel, any Error>) -> Void) {
        service.fetchData(cep: cep) { result in
            switch result {
            case .success(let dataModel):
                completion(.success(dataModel))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func fetchData() {
        service.didFetchData() 
    }
    
}
