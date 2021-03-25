//
//  EndPoints.swift
//  SimpleMovieApp
//
//  Created by Rodrigo Gaspar on 25/03/21.
//

//
//  API.swift
//  idolov-ios
//
//  Created by Noclaf Tech on 22/10/20.
//  Copyright © 2020 Noclaf Tech. All rights reserved.
//

import Alamofire
import UIKit

class API {
    
    static let host = "https://api.themoviedb.org/3/"
    
    static let movie = "movie/"
    
    static let sharedInstance = API()
    
    var sessionManager : Session!
    
    var apiKey = "b92ef6b14724a85069472ee727100d4a"
    
    /* *********************************************************************************
     **
     **  MARK: Init
     **
     ***********************************************************************************/
    
    
    fileprivate init() {
        
        let configuration = URLSessionConfiguration.default
        
        sessionManager = Alamofire.Session(configuration: configuration)
        
    }
    
}

