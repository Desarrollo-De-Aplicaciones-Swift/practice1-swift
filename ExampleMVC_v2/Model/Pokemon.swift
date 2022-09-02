//
//  Pokemon.swift
//  ExampleMVC_v2
//
//  Created by DISMOV on 01/09/22.
//

import Foundation

struct Pokemon {
    let name: String
    let move: String
    let ability: String
    let weight: String
    let image: String
}

extension Pokemon{
    init(dict: [String:String]){
        self.name = dict["name"]!
        self.move = dict["move"]!
        self.ability = dict["ability"]!
        self.weight = dict["weight"]!
        self.image = dict["image"]!
    }
}
