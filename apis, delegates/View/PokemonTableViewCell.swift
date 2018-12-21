//
//  PokemonTableViewCell.swift
//  apis, delegates
//
//  Created by Greg Hughes on 12/16/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    var pokemon : Pokemon? {
        
        didSet {
            updateViews()
        }
    }
    
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    
    
    func updateViews(){
        
        guard let pokemon = pokemon else {return};
        
        DispatchQueue.main.async {
            
            self.pokemonNameLabel.text = pokemon.name.capitalized
            
        }
        
    }
    
}
