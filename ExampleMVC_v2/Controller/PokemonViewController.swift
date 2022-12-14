//
//  PokemonViewController.swift
//  ExampleMVC_v2
//
//  Created by DISMOV on 01/09/22.
//

import UIKit

class PokemonViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var pokemon : [Pokemon] = []
    
    let manager = PokemonDataManager()
    
    @IBOutlet var PokemonCollectionView: UICollectionView!
    
    var selectPokemon : Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetch()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.pokemonCount()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath)as! PokeCell
        
        let pokemon = manager.pokemonAtIndex(index: indexPath.row)
        cell.pokemonImageView.image = UIImage.init(named: pokemon.image)
        cell.pokemonLabel.text = pokemon.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectPokemon = manager.pokemonAtIndex(index: indexPath.row)
        self.performSegue(withIdentifier: "PokemonDetailSegue", sender: Self.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderReusableView", for: indexPath) as? HeaderCollectionReusableView {
                    header.imageHeader.image = UIImage.init(named: "pokemon")
                    return header
                    }
            default:
                return UICollectionReusableView()
            
        }
        return UICollectionReusableView()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PokemonDetailViewController
        destination.recivedPokemon = selectPokemon
    }
}
