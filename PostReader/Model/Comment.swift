//
//  Comment.swift
//  PostReader
//
//  Created by Iain Coleman on 18/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String    
    
}
