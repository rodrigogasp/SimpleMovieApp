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

class EndPoints {
    
    static let host = "https://api.idolov.com"
    
    static let auth = "/coreapp/auth/"
    
    static let user = "/coreapp/user/"
    
    static let home = "/coreapp/home/"
    
    static let artist = "/coreapp/artist/"
    
    static let call = "/callapp/call/"
    
    static let constants = "/coreapp/constants/"
    
    static let notifications = "/notificationapp/notification/"
    
    static let deleteNotificationAll = "/notificationapp/notification/delete-all/"
    
    static let invite = "/coreapp/user/invite/"
    
    static let search = "/coreapp/search/"
    
    static let configuration = "/coreapp/artist/configuration/"
    
    static let forgotPassword = "/coreapp/user/forgot-password/"
    
    static let creditCardPayment = "/paymentapp/call-acquisition/"
    
    static let socialNetWorkLogin = "/socialnetworkapp/social-network-auth/"
    
    static let appleAuth = "/socialnetworkapp/apple-auth/"

    //------------------------- Singleton -----------------------------
    
    static let sharedInstance = API()
    
    var sessionManager : Session!
    
    /* *********************************************************************************
     **
     **  MARK: Init
     **
     ***********************************************************************************/
    
    
    fileprivate init() {
        
        let language = Locale.preferredLanguages[0] as String
                
        //---------------------- Default Header ----------------------------

        var headers = HTTPHeaders.default

        headers["Accept-Language"] = "\(language.prefix(2))"

        headers["The-Timezone-IANA"] = "America/Sao_Paulo"

//       if !TimeZone.current.identifier.isEmpty {
//
//            headers["The-Timezone-IANA"] = TimeZone.current.identifier
//
//        } else {
//
//            headers["The-Timezone-IANA"] = "America/Sao_Paulo"
//
//        }

        //----------------------- URLSessionConfiguration ---------------------

        let configuration = URLSessionConfiguration.default

        configuration.headers = headers

        //----------------------- Session Manager -----------------------------

        sessionManager = Alamofire.Session(configuration: configuration)
        
    }
    
}

