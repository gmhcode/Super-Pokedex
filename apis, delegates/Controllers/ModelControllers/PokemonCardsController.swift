//
//  PokemonCardsController.swift
//  apis, delegates
//
//  Created by Greg Hughes on 12/22/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation
import UIKit

class PokemonCardController {
    
    static let baseUrl = URL(string: "https://api.pokemontcg.io/v1/cards")
    
    
    
    static func fetchPokemonCards(searchTerm: String, completion: @escaping ([PokemonCard]?) -> ()){
        
        
        guard let url = baseUrl else { completion(nil) ; return }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let itemQuery = URLQueryItem(name: "name", value: searchTerm)
        
        components?.queryItems = [itemQuery]
        
        guard let cardUrl = components?.url else { completion(nil) ; return }
        print(cardUrl)
        
        URLSession.shared.dataTask(with: cardUrl) { (data, response, error) in
            
            
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription)")
                
                completion(nil) ; return
            }
            
            
            guard let data = data else {completion(nil) ; return}
            
            do{
                
                let jsonDecoder = JSONDecoder()
                let topLevelDictionaryForCards = try jsonDecoder.decode(TopLevelDictionaryForCards.self, from: data)
                let pokemonCards = topLevelDictionaryForCards.cards
                
                completion(pokemonCards)
            }
            catch{
                
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription)")
                
                completion(nil)
            }
        }.resume()
    }
    
    
    static func fetchPokemonCardImages(for pokemonCardName: PokemonCard, completion: @escaping (UIImage?) -> ()){
        
        let imageUrl = pokemonCardName.imageUrl
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

    
    
    
    
    



