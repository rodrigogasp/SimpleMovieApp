//
//  DAOMovie.swift
//  SimpleMovieApp
//
//  Created by Rodrigo Gaspar on 25/03/21.
//

import Foundation
import UIKit

class DAOMovie {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArrayMovie(_ JSON : AnyObject) -> [Movie] {
        
        var array : [Movie] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInMovie(item as AnyObject))
            
        }
        
        return array
        
    }
    
    static func transformJSONInMovie(_ JSON : AnyObject) -> Movie {
        
        let item = Movie()
        
        if let info = JSON["title"] as? String {
            item.title = info
        }
        
        if let info = JSON["vote_count"] as? Int {
            item.voteCount = info
        }
        
        if let info = JSON["popularity"] as? Int {
            item.popularity = info
        }
        
        if let info = JSON["poster_path"] as? String {
            item.image = "https://image.tmdb.org/t/p/w500" + info
        }
        
        if let info = JSON["release_date"] as? String {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = TimeZone.current
            
            if let date = dateFormatter.date(from: info) {
                
                item.releaseDate = date
                
            }
            
        }
        
        if let genres = JSON["genres"] as? [[String : Any]] {
            
            for genre in genres {
                
                if let name = genre["name"] as? String {
                    
                    item.genres.append(name)
                    
                }
                
            }
            
        }

        return item
        
    }
    
}


