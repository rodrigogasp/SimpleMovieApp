//
//  ViewController.swift
//  SimpleMovieApp
//
//  Created by Rodrigo Gaspar on 25/03/21.
//

import UIKit

class MovieVC: UIViewController {
    
    //MARK: Variables
    
    var movieView : MovieView!
    
    //MARK: View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView = MovieView(view: view, parent: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
}

