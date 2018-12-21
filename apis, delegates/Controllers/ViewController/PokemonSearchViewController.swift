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
    var searchPokemon = String()
    
    
    
    @IBOutlet weak var pokemonListTableView: UITableView!
    @IBOutlet weak var pokemonListSearchBar: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PokemonController.fetchMainPokemonList { (pokemonList) in
            self.pokemonList = pokemonList ?? []
            DispatchQueue.main.async {
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
        
        
        
        if searchPokemon != "" {
            
            
            
            
            
        }
        
        
        
        
        return cell
    }
}


extension PokemonSearchViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchBarText = searchBar.text else {return}
        
        searchPokemon = searchBarText
        
        
        
    }
    
    
}
