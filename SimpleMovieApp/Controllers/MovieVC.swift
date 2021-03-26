//
//  ViewController.swift
//  SimpleMovieApp
//
//  Created by Rodrigo Gaspar on 25/03/21.
//

import UIKit
import SDWebImage

class MovieVC: UIViewController {
    
    //MARK: Variables
    
    var movieView : MovieView!
    
    var liked : Bool = false
    
    var movie : Movie!
    
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
        
        MovieRequests.getMovieById { (response) in
            
            if response.success {
                
                self.movie = response.movie
                
                self.setInfo()
                
            } else {
                
                
                
            }
            
        }
        
        
    }
    
    //MARK: Set info
    
    func setInfo() {
        
        let url = URL(string: self.movie.image)
        
        if url != nil {
            
            movieView.movieImage.sd_setImage(with: url, completed: nil)
            
        }
        
        movieView.nameLabel.text = self.movie.title
        movieView.nameLabel.sizeToFit()
        
        movieView.heartIcon.frame.origin.y = movieView.nameLabel.frame.origin.y + movieView.nameLabel.frame.height + 5
        
        movieView.likesLabel.text = self.movie.voteCount + "k Likes"
        movieView.likesLabel.sizeToFit()
        movieView.likesLabel.center.y = movieView.heartIcon.center.y
        
        movieView.popularityLabel.text = self.movie.popularity + " de visualizações"
        movieView.popularityLabel.sizeToFit()
        movieView.popularityLabel.frame.origin.x = movieView.likesLabel.frame.origin.x + movieView.likesLabel.frame.width + 10
        movieView.popularityLabel.center.y = movieView.likesLabel.center.y
        

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

