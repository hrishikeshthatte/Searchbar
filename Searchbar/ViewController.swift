//
//  ViewController.swift
//  Searchbar
//
//  Created by Admin on 06/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate{
    
    @IBOutlet weak var datasearchBar: UISearchBar!
    
    @IBOutlet weak var datatbView: UITableView!
    
    let countryarr = ["Afghanistan","Albania","Algeria","American Samoa","Andorra",":Angola","Anguilla","Antarctica","Barbuda","Argentina","Armenia","Aruba","Australia","Austria","India","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor-Leste","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands","Tuvalu","U.S. Minor Outlying Islands","U.S. Miscellaneous Pacific Islands","U.S. Virgin Islands","Uganda","Ukraine","Union of Soviet Socialist Republic","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","VaticanCity","Venezuela","Vietnam","Wake Island","Wallis and Futuna","WesternSahara","Yemen","Zambia","Zimbabwe","ÅlandIslands"]
    var srcharr = [String]()
    var searching = false
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
           return srcharr.count
        }
        else
        {
        return countryarr.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        if searching
        {
            cell.textLabel?.text = srcharr[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = countryarr[indexPath.row]
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        srcharr = countryarr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        datatbView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datatbView.dataSource = self
        datatbView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching  = false
        searchBar.text = ""
        datatbView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

