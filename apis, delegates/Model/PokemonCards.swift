//
//  PokemonCards.swift
//  apis, delegates
//
//  Created by Greg Hughes on 12/22/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation
import UIKit
// https://api.pokemontcg.io/v1/cards?name=pikachu

struct TopLevelDictionaryForCards: Codable {
    
    let cards : [PokemonCard]
    
}

struct PokemonCard: Codable {
    
    let imageUrl : URL
    
}



