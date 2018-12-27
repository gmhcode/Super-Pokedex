//
//  CardsViewController.swift
//  apis, delegates
//
//  Created by Greg Hughes on 12/26/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    
    
    var pokemonNameLandingPad : String = ""
    var pokemonCardsSource : [PokemonCard]? = []
    
    @IBOutlet weak var cardsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - fetch cards
        
        //        PokemonCardController.fetchPokemonCards(searchTerm: self.pokemonNameLandingPad) { (pokemonCards) in
        //            self.pokemonCardsSource = pokemonCards
        //
        //        }

        
        // why cant i have fetch in viewDidLoad?
        
        
        cardsTableView.delegate = self
        cardsTableView.dataSource = self
        
    }
    
    // MARK: - Table view data source
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pokemonNameLandingPad.count
    }
    
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardTableViewCell
        
        
        
        
        PokemonCardController.fetchPokemonCards(searchTerm: self.pokemonNameLandingPad) { (pokemonCards) in
            self.pokemonCardsSource = pokemonCards
            
            let pokemonCard = self.pokemonCardsSource?[indexPath.row]
            
            cell.pokemonCard = pokemonCard
            
        }
        
        cell.selectionStyle = .none
        
        
        
        
        return cell
    }
}

