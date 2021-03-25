//
//  MovieView.swift
//  SimpleMovieApp
//
//  Created by Rodrigo Gaspar on 25/03/21.
//

import UIKit

class MovieView: UIView {
    
    //MARK: Variables
    
    var scrollView: UIScrollView!
    
    var movieImage : UIImageView!
    
    var backButton : UIButton!
    
    var nameLabel : UILabel!
    
    var heartIcon : UIImageView!
    
    var likesLabel : UILabel!
    
    var popularityLabel : UILabel!
    
    var tableView : UITableView!
    
    //MARK: Init
    
    init(view: UIView, parent: UIViewController) {
        super.init(frame: view.frame);
        
        view.backgroundColor = .white
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        var yPosition = CGFloat(0)
        
        //-----------------------------Scroll View--------------------------------------
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .black
        
        view.addSubview(scrollView)
        
        //-----------------------------Movie Image--------------------------------------
        
        movieImage = UIImageView(frame: CGRect(x: 0, y: -UIApplication.shared.statusBarFrame.height, width: width, height: height*0.5))
        movieImage.contentMode = .scaleAspectFill
        movieImage.clipsToBounds = true
        movieImage.backgroundColor = .red
        movieImage.image = UIImage(named: "mock")
        
        scrollView.addSubview(movieImage)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: movieImage.frame.height)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.9), UIColor.black.cgColor]
        
        movieImage.layer.insertSublayer(gradientLayer, at: 0)
        
        yPosition = movieImage.frame.origin.y + movieImage.frame.height*0.95
        
        //-----------------------------Back Button--------------------------------------
        
        backButton = UIButton(frame: CGRect(x: width*0.05, y: height*0.1, width: 30, height: 30))
        backButton.backgroundColor = .black
        backButton.setImage(UIImage(named: "back")?.withTintColor(.white), for: .normal)
        backButton.layer.cornerRadius = backButton.frame.height/2
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 2)
        
        scrollView.addSubview(backButton)
        
        //-----------------------------Name Label--------------------------------------
        
        nameLabel = UILabel(frame: CGRect(x: width*0.05, y: yPosition, width: width*0.5, height: 70))
        nameLabel.text = "The Very Best of Johnny Depp"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byTruncatingTail
        
        scrollView.addSubview(nameLabel)
        
        yPosition = yPosition + nameLabel.frame.height + 5
        
        //-----------------------------Heart Icon--------------------------------------
        
        heartIcon = UIImageView(frame: CGRect(x: width*0.05, y: yPosition, width: 25, height: 25))
        heartIcon.image = UIImage(named: "emptyHeart")
        heartIcon.contentMode = .scaleAspectFit
        heartIcon.clipsToBounds = true
        
        scrollView.addSubview(heartIcon)
        
        //-----------------------------Likes Label--------------------------------------
        
        likesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        likesLabel.text = "1.2K likes"
        likesLabel.textColor = .white
        likesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesLabel.sizeToFit()
        likesLabel.frame.origin.x = heartIcon.frame.origin.x + heartIcon.frame.width + 5
        likesLabel.center.y = heartIcon.center.y
        
        scrollView.addSubview(likesLabel)
        
        //-----------------------------Popularity Label--------------------------------------
        
        popularityLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        popularityLabel.text = "Some mock text"
        popularityLabel.textColor = .white
        popularityLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        popularityLabel.sizeToFit()
        popularityLabel.frame.origin.x = likesLabel.frame.origin.x + likesLabel.frame.width + 20
        popularityLabel.center.y = heartIcon.center.y
        
        scrollView.addSubview(popularityLabel)
        
        //-----------------------------Table View --------------------------------------
        
        tableView = UITableView(frame: CGRect(x: 0, y: yPosition, width: width, height: height - yPosition))
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: width*0.1, right: 0)
        tableView.isScrollEnabled = true
        
        scrollView.addSubview(tableView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

