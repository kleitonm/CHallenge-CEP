//
//  HomeServiceTests.swift
//  LeardingAPITests
//
//  Created by Kleiton Mendes on 11/07/24.
//

import XCTest
@testable import LeardingAPI

final class HomeServiceTests: XCTestCase {

    func test_fetchDataSuccess() {
        let (sut, spy) = makeSut()
        let dataObject = DataModel(cep: "04947007", localidade: "Jd Nove de Julho", logradouro: "São Paulo", bairro: "Sp")
        let exp = expectation(description: "Fetch Data Success")
        
        spy.expectedFetchData = .success(dataObject)
        
        sut.fetchData(cep: "04947007") { result in
            if case .success(let dataModel) = result {
                XCTAssertNotNil(dataModel)
                XCTAssertEqual(dataModel.bairro, dataObject.bairro)
                XCTAssertEqual(dataModel.cep, dataObject.cep)
                XCTAssertEqual(dataModel.localidade, dataObject.localidade)
                XCTAssertEqual(dataModel.logradouro, dataObject.logradouro)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    func test_fetchDataFailure() {
        let (sut, spy) = makeSut()
        let error: NSError = .init(domain: "failure", code: 400)
        let exp = expectation(description: "Fetch Data Failure")
        
        spy.expectedFetchData = .failure(error)
        
        sut.fetchData(cep: "05789") { result in
            if case .failure(let failure) = result {
                XCTAssertNotNil(failure)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    func test_didFetchData() {
        let (sut, spy) = makeSut()
        
        sut.didFetchData()
        XCTAssertFalse(spy.didFetchDataCalled)
        XCTAssertEqual(spy.didFetchDataCounting, 0)
    }
    
}

extension HomeServiceTests {
    private func makeSut() -> (sut: HomeService, spy: HomeServiceProtocolSpy) {
        
        let spy = HomeServiceProtocolSpy()
        let sut = HomeService()
        return (sut, spy)
    }
}


