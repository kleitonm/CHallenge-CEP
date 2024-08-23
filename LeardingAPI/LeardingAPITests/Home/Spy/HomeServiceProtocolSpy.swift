//
//  HomeServiceProtocolSpy.swift
//  LeardingAPITests
//
//  Created by Kleiton Mendes on 11/07/24.
//

import Foundation
@testable import LeardingAPI

final class HomeServiceProtocolSpy: HomeServiceProtocol {
    
    var expectedFetchData: (Result<DataModel, any Error>)?
    private(set) var didFetchDataCalled: Bool = false
    private(set) var didFetchDataCounting: Int = 0
    
    func fetchData(cep: String, completion: @escaping (Result<LeardingAPI.DataModel, any Error>) -> Void) {
        if let expectedFetchData {
            completion(expectedFetchData)
        }
    }
    
    func didFetchData() {
        didFetchDataCalled = true
        didFetchDataCounting += 1
    }
    
    
}
