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
        
        movieView.tableView.delegate = self
        movieView.tableView.dataSource = self
        
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

extension MovieVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = RelatedMovieCell(view: view)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 105
        
    }
    
    
    
    
    
}

