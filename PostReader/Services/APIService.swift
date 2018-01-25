//
//  APIService.swift
//  PostReader
//
//  Created by Iain Coleman on 18/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//


import Foundation


class APIService {
    
    static let instance = APIService()
    
    public private(set) var postsArray = [Post]()
    public private(set) var usersArray = [User]()
    
    
    func getPosts(completion: @escaping CompletionHandler) {
        
        //NOT using Alamofire or any third party framework for this project!
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = "/posts"
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components")}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in DispatchQueue.main.async {
            guard responseError == nil else {
                completion(false)
                return
            }
            
            guard let jsonData = responseData else {
                debugPrint(responseError as Any)
                completion(false)
                return
            }

            let decoder = JSONDecoder()
            
            do {
                self.postsArray.removeAll()
                self.postsArray = try decoder.decode([Post].self, from: jsonData)
                completion(true)
            } catch {
                debugPrint(responseError as Any)
                completion(false)
            }
            }
            
        }
        task.resume()
    }
    
    
    
    func getUsers(completion: @escaping CompletionHandler) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = "/users"
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components")}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in DispatchQueue.main.async {
            guard responseError == nil else {
                completion(false)
                return
            }
            
            guard let jsonData = responseData else {
                debugPrint(responseError as Any)
                completion(false)
                return
            }

            let decoder = JSONDecoder()
            
            do {
                self.usersArray.removeAll()
                self.usersArray = try decoder.decode([User].self, from: jsonData)
                completion(true)
            } catch {
                debugPrint(responseError as Any)
                completion(false)
            }
            }
            
        }
        task.resume()
    }
   
    
    
}
