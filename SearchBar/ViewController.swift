//
//  ViewController.swift
//  SearchBar
//
//  Created by Elizabeth Rudenko on 26/03/2020.
//  Copyright © 2020 Elizabeth Rudenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var scopeBarLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        animateCancelButton(show: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchLabel.text = searchText.isEmpty ? searchBar.placeholder : searchText
        if searchBar.showsCancelButton == false, !searchText.isEmpty {
            animateCancelButton(show: true)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchLabel.text = searchBar.placeholder
        animateCancelButton(show: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        scopeBarLabel.text = searchBar.scopeButtonTitles?[selectedScope]
    }
}

// MARK: - Anumation
extension ViewController {
    func animateCancelButton(show: Bool) {
        searchBar.showsCancelButton = show
        UIView.animate(withDuration: 0.15, animations: {
            self.searchBar.layoutIfNeeded()
        })
    }
}
