//
//  Post.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

struct Post: Codable {
	let userId: Int
	let id: Int
	let title: String
	let body: String
}

typealias Posts = [Post]
