//
//  RelatedMovieCell.swift
//  SimpleMovieApp
//
//  Created by Rodrigo Gaspar on 25/03/21.
//

import UIKit

class RelatedMovieCell: UITableViewCell {
    
    //MARK: Variables
    
    var mainImage : UIImageView!
    
    var movieInfo : UILabel!
    
    //MARK: Init
    
    init(view: UIView) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        
        let width = view.frame.size.width
        
        let height : CGFloat = 100
        
        self.backgroundColor = UIColor.clear
        
        self.selectionStyle = .none
        
        //---------------------------Main image-----------------------------
        
        mainImage = UIImageView(frame: CGRect(x: width*0.05, y: 0, width: width*0.175, height: height - 10))
        mainImage.contentMode = .scaleAspectFill
        mainImage.clipsToBounds = true
        mainImage.image = UIImage(named: "mock")
        mainImage.center.y = height/2
        
        contentView.addSubview(mainImage)
        
        let xPosition = mainImage.frame.origin.x + mainImage.frame.width + 10
        
        //---------------------------Movie Title-----------------------------
        
        movieInfo = UILabel(frame: CGRect(x: xPosition, y: 0, width: width*0.8, height: 0))
        movieInfo.textColor = .white
        movieInfo.font = UIFont.systemFont(ofSize: 16)
        movieInfo.numberOfLines = 0
        movieInfo.lineBreakMode = .byTruncatingTail
        
        
        contentView.addSubview(movieInfo)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

