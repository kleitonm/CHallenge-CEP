//
//  DataModel.swift
//  LeardingAPI
//
//  Created by Kleiton Mendes on 01/07/24.
//

import Foundation

struct DataModel: Decodable {
    let cep: String
    let localidade: String
    let logradouro: String
    let bairro: String
}
