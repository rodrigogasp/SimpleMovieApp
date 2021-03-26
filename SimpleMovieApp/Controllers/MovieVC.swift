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
    
    var movieArray : [Movie] = []
    
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
        
        self.startLoading()
        
        MovieRequests.getMovieById { (response) in
            
            self.stopLoading()
            
            if response.success {
                
                self.movie = response.movie
                
                self.setInfo()
                
                MovieRequests.getRelated { (response) in
                    
                    if response.success {
                        
                        self.movieArray = response.movies
                        
                        self.movieView.tableView.reloadData()
                        
                    } else {
                        
                        GenericAlert.genericAlert(self, title: "Erro ao carregar filmes similares", message: "", actions: [])
                        
                    }
                    
                }
                
            } else {
                
                GenericAlert.genericAlert(self, title: "Erro ao carregar filme", message: "", actions: [])
                
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
        
        movieView.cameraIcon.frame.origin.x = movieView.likesLabel.frame.origin.x + movieView.likesLabel.frame.width + 10
        movieView.cameraIcon.center.y = movieView.heartIcon.center.y
        
        movieView.popularityLabel.text = self.movie.popularity + " de visualizações"
        movieView.popularityLabel.sizeToFit()
        movieView.popularityLabel.frame.origin.x = movieView.cameraIcon.frame.origin.x + movieView.cameraIcon.frame.width + 5
        movieView.popularityLabel.center.y = movieView.likesLabel.center.y
        
        movieView.tableView.frame.origin.y = movieView.popularityLabel.frame.origin.y + movieView.popularityLabel.frame.height + 20
        movieView.tableView.frame.size.height = movieView.scrollView.frame.height - movieView.tableView.frame.origin.y - UIApplication.shared.statusBarFrame.height

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
        
        movieArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = RelatedMovieCell(view: view)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        
        let dateString = formatter.string(from: movieArray[indexPath.row].releaseDate)
        
        cell.movieInfo.text = self.movieArray[indexPath.row].title + "\n" + dateString
        
        for genre in self.movieArray[indexPath.row].genres {
            
            cell.movieInfo.text = cell.movieInfo.text! + " \(genre),"
            
        }
        
        cell.movieInfo.sizeToFit()
        cell.movieInfo.center.y = cell.mainImage.center.y
        
        let url = URL(string: self.movieArray[indexPath.row].image)
        
        if url != nil {
            
            cell.mainImage.sd_setImage(with: url, completed: nil)
            
        }
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 105
        
    }
    
    
    
    
    
}

