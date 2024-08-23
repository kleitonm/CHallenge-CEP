//
//  ViewController.swift
//  LeardingAPI
//
//  Created by Kleiton Mendes on 01/07/24.
//

import UIKit

final class HomeViewController: UIViewController {

    private let viewModel: HomeViewModelProtocol
    
    private lazy var textFieldCep: UITextField = {
        let text = UITextField()
        text.placeholder = "Digite o CEP"
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var searchCepButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Buscar", for: .normal)
        btn.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
   
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(textFieldCep)
        view.addSubview(searchCepButton)
        
        NSLayoutConstraint.activate([
            textFieldCep.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textFieldCep.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldCep.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            searchCepButton.topAnchor.constraint(equalTo: textFieldCep.bottomAnchor, constant: 10),
            searchCepButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchCepButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

    }
    
}

extension HomeViewController {
    private func didSearch(from cep: String) {
        viewModel.handleData(cep: cep) { result in
            switch result {
            case .success(let dataModel):
                dump(dataModel)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

extension HomeViewController {
    @objc func handleSearch() {
        if let cep = textFieldCep.text {
            didSearch(from: cep)
        }
    }
}
