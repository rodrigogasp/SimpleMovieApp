//
//  MovieRequests.swift
//  SimpleMovieApp
//
//  Created by Rodrigo Gaspar on 25/03/21.
//


import UIKit
import Alamofire

class MovieRequests {
    
    fileprivate init () {
        
    }
    
    /* *********************************************************************************
     **
     **  MARK: LogIn
     **
     ***********************************************************************************/
    
    static func getMovieById(callback: @escaping (ServerResponse) -> Void) {
        
        let newURL = API.host + API.movie + "286217"
        
        var params = [String : Any]()
        
        params["api_key"] = API.sharedInstance.apiKey
        params["language"] = "pt-BR"
        
        print("resquest - getMovieById")
        print(newURL)
        print(params)
        
        API.sharedInstance.sessionManager.request(newURL,
                      method: HTTPMethod.get,
                      parameters: params,
                      encoding: URLEncoding.default,
                      headers: nil
        ).responseJSON(completionHandler: { response in
            
            let resposta = ServerResponse()
            
            print("response - getMovieById")
            print(response.result)
            
            switch response.result {
                
            case let .success(value):
                resposta.statusCode = response.response?.statusCode ?? 0
                
                if response.response?.statusCode == 200 {
                    
                    resposta.movie = DAOMovie.transformJSONInMovie(value as AnyObject)
                    
                    resposta.success = true
                    
                    callback(resposta)
                    
                    return
                    
                }
                
            case let .failure(error):
                print(error)
             
            }
            
            resposta.success = false
            resposta.erroMessage = "Erro ao carregar filme"
            
            callback(resposta)
            
        })
        
    }

}

