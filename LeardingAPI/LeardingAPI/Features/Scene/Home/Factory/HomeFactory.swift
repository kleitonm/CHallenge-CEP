//
//  HomeFactory.swift
//  LeardingAPI
//
//  Created by Kleiton Mendes on 01/07/24.
//

import UIKit

enum HomeFactory {
    static func make() -> UIViewController {
        let service = HomeService()
        let viewModel = HomeViewModel(service: service)
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
