//
//  CardsTableViewController.swift
//  apis, delegates
//
//  Created by Greg Hughes on 12/24/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class CardsTableViewController: UITableViewController {
    
    
    var pokemonNameLandingPad : String = ""
    var pokemonCardsSource : [PokemonCard]? = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - fetch cards
        DispatchQueue.main.async {
            
            PokemonCardController.fetchPokemonCards(searchTerm: self.pokemonNameLandingPad) { (pokemonCards) in
                self.pokemonCardsSource = pokemonCards
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pokemonNameLandingPad.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardTableViewCell
       
        
        
            
        
        
        let pokemonCard = pokemonCardsSource?[indexPath.row]
        
        cell.pokemonCard = pokemonCard
        
        
           
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
}
