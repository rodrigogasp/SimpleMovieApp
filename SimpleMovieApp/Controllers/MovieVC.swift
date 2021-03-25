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
    
    var liked : Bool = false
    
    //MARK: View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieView = MovieView(view: view, parent: self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        
        movieView.heartIcon.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    //MARK: Like Action
    
    @objc func likeAction() {
        
        if liked {
            
            movieView.heartIcon.image = UIImage(named: "emptyHeart")
            liked.toggle()
            
        } else {
            
            movieView.heartIcon.image = UIImage(named: "fullHeart")
            liked.toggle()
            
        }
        
    }
    
    
}

