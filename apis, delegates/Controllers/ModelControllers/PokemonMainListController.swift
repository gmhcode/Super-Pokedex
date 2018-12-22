//
//  PokemonController.swift
//  apis, delegates
//
//  Created by Greg Hughes on 12/16/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation
import UIKit
class PokemonMainListController {
    
    
    static let baseUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/")
    
    static func fetchMainPokemonList(completion: @escaping ([Pokemon]?) -> ()){
        
        
        guard let url = baseUrl else {completion(nil) ; return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
               
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription)")
                
                completion(nil)
                return
            }
            
            print(url)
            
            guard let data = data else {completion(nil) ; return}
            
            do{
                
                let jsonDecoder = JSONDecoder()
                let pokemonData = try jsonDecoder.decode(TopLevelDictionary.self, from: data)
                let pokemonList = pokemonData.results
                
                completion(pokemonList)
                
                
            }catch{
                
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription)")
               
                completion(nil)
                return
            }
        }.resume()
    }
}

