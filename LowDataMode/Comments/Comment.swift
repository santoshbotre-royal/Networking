//
//  Comment.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

struct Comment: Decodable {
	let postId: Int
	let id: Int
	let name: String
	let email: String
	let body: String
}

typealias Comments = [Comment]
