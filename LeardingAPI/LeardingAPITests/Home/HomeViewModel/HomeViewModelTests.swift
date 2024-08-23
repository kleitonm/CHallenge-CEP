//
//  HomeViewModelTests.swift
//  LeardingAPITests
//
//  Created by Kleiton Mendes on 06/07/24.
//

import XCTest
@testable import LeardingAPI

final class HomeViewModelTests: XCTestCase {

    func test_fetchDataFailure() {
        let (sut, spy) = makeSut()
        let exp = expectation(description: "Fetch Data Failure")
        let error: NSError = .init(domain: "failure", code: 400)
        
        spy.expectedResponse = .failure(error)
        
        sut.handleData(cep: "03947000") { result in
            if case .failure(let failure) = result {
                XCTAssertNotNil(failure)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    func test_fetchDataSuccess() {
        let (sut, spy) = makeSut()
        let dataObject: DataModel = .fixture()
        let exp = expectation(description: "Fetch Data Success")
        
        spy.expectedResponse = .success(dataObject)
        
        sut.handleData(cep: dataObject.cep) { result in
            if case .success(let dataModel) = result {
                XCTAssertNotNil(dataModel)
                XCTAssertEqual(dataModel.cep, "03947000")
                XCTAssertEqual(dataModel.bairro, "Jd Nove de Julho")
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    func test_fetchData() {
        let (sut, spy) = makeSut()
        
        sut.fetchData()
        XCTAssertTrue(spy.didFetchDataCalled)
        XCTAssertEqual(spy.didFetchDataCounting, 1)
    }
    
}

extension HomeViewModelTests {
    private func makeSut() -> (sut: HomeViewModel, spy: HomeViewModelSpy) {
        
        let spy = HomeViewModelSpy()
        let sut = HomeViewModel(service: spy)
        return (sut, spy)
    }
}

extension DataModel {
    static func fixture(cep: String = "03947000", localidade: String = "São Paulo", logradouro: String = "Sp", bairro: String = "Jd Nove de Julho") -> Self {
        .init(cep: cep, localidade: localidade, logradouro: logradouro, bairro: bairro)
    }
}
