//
//  CardTableViewCell.swift
//  apis, delegates
//
//  Created by Greg Hughes on 12/24/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    var pokemonCard : PokemonCard? {
        didSet {
            updateViews()
        }
    }
    
    
    
    
    
    func updateViews(){
        
        guard let pokemonCard = pokemonCard else {return}
        
        
        PokemonCardController.fetchPokemonCardImages(for: pokemonCard) { (image) in
            
            DispatchQueue.main.async {
                
                self.cardImageView.image = image
                
            }
        }
    }
}
