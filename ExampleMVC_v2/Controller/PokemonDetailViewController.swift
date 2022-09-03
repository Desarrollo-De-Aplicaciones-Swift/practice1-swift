//
//  PokemonDetailViewController.swift
//  ExampleMVC_v2
//
//  Created by DISMOV on 02/09/22.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var recivedPokemon : Pokemon?
    
    @IBOutlet var namePokemonLabel: UILabel!
    @IBOutlet var imagePokemonImageView: UIImageView!
    @IBOutlet var movePokemonLabel: UILabel!
    @IBOutlet var habilityPokemonLabel: UILabel!
    @IBOutlet var weightPokemonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namePokemonLabel.text = recivedPokemon?.name
        imagePokemonImageView.image = UIImage(named: recivedPokemon!.image)
        movePokemonLabel.text = recivedPokemon?.move
        habilityPokemonLabel.text = recivedPokemon?.ability
        weightPokemonLabel.text = recivedPokemon?.weight
        
        
    }
    

}
