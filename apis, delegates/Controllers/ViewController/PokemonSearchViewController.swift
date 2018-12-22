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
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonListCell") as! PokemonTableViewCell
        
        let pokemon = pokemonList[indexPath.row]
        
        cell.pokemon = pokemon
        
        
        
        return cell
    }
}


extension PokemonSearchViewController: UISearchBarDelegate{
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("hit")
        
        
        for searchPokemonLoop in pokemonList{
            //use forloop to find the index
            
            if searchPokemonLoop.name  == searchBar.text?.lowercased(){
                
                guard let indexOfPokemon = pokemonList.index(of: searchPokemonLoop) else {return}
                
                pokemonListTableView.scrollToRow(at: IndexPath(item: indexOfPokemon + 4, section: 0), at: UITableView.ScrollPosition.none, animated: true)
                
                
        }
        
        DispatchQueue.main.async {
            
            self.pokemonListTableView.reloadData()
        }
    }
    }
    
}
