//
//  Post.swift
//  PostReader
//
//  Created by Iain Coleman on 18/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import Foundation

struct Post: Decodable {

    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
