//
//  HomeViewModelSpy.swift
//  LeardingAPITests
//
//  Created by Kleiton Mendes on 06/07/24.
//

import Foundation
@testable import LeardingAPI

final class HomeViewModelSpy: HomeServiceProtocol {
    
    var expectedResponse: (Result<DataModel, any Error>)?
    private(set) var didFetchDataCalled: Bool = false
    private(set) var didFetchDataCounting: Int = 0
    
    func fetchData(cep: String, completion: @escaping (Result<LeardingAPI.DataModel, any Error>) -> Void) {
        
        if let expectedResponse {
            completion(expectedResponse)
        }
    }
    
    func didFetchData() {
        didFetchDataCalled = true
        didFetchDataCounting += 1
    }
}
