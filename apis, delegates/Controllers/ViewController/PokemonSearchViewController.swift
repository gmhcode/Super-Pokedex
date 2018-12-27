//
//  ViewController.swift
//  apis, delegates
//
//  Created by Greg Hughes on 12/16/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pokemonList : [Pokemon] = []
    
    @IBOutlet weak var pokemonListTableView: UITableView!
    @IBOutlet weak var pokemonListSearchBar: UISearchBar!
    
   
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonListSearchBar.isHidden = false
        
        
        PokemonMainListController.fetchMainPokemonList { (pokemonList) in
            
            DispatchQueue.main.async {
                
                self.pokemonList = pokemonList ?? []
                self.pokemonListTableView.reloadData()
            }
        }
        pokemonListTableView.delegate = self
        pokemonListTableView.dataSource = self
        pokemonListSearchBar.delegate = self
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return pokemonList.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonListCell") as! PokemonTableViewCell
        
        let pokemon = pokemonList[indexPath.row]
        
        cell.pokemon = pokemon
        
        
        
        return cell
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "cardsScreenSegue" {
            
            guard let indexPath = pokemonListTableView.indexPathForSelectedRow else {return}
            
            let destinationVC = segue.destination as? CardsViewController
            
            let pokemonName = pokemonList[indexPath.row].name.lowercased()
            
            print(pokemonName)
            

            destinationVC?.pokemonNameLandingPad = pokemonName
           }
        }
    
    
    
    
    
    
    
    }



extension PokemonSearchViewController: UISearchBarDelegate{
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("hit")
        
        
        for searchPokemonLoop in pokemonList{
            //use forloop to find the index
            
            if searchPokemonLoop.name  == searchBar.text?.lowercased(){
                
                guard let indexOfPokemon = pokemonList.index(of: searchPokemonLoop) else {return}
                
                
                // MARK: - Search scroll functionality. select row at has better functionality
//                pokemonListTableView.scrollToRow(at: IndexPath(item: indexOfPokemon, section: 0), at: UITableView.ScrollPosition.none, animated: true)
                
                
                
                // MARK: - Search result as middle row functionality
                pokemonListTableView.selectRow(at: IndexPath(item: indexOfPokemon, section: 0), animated: true, scrollPosition: .middle)
                
                
            }
            
        }
    }
}


