//
//  RequestPosts.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

protocol RequestingPosts {
	var network: Networking { get }
	func getPosts(_ completion: @escaping (Result<Posts, Error>) -> Void)
}

extension RequestingPosts {
	func getPosts(_ completion: @escaping (Result<Posts, Error>) -> Void) {
		network.request(Endpoint.posts, completion: completion)
	}
}

struct PostRequestHandler: RequestingPosts {
	var network: Networking
	init(network: Networking) {
		self.network = network
	}
	
	func getPosts(_ completion: @escaping (Result<Posts, Error>) -> Void) {
		network.request(Endpoint.posts, completion: completion)
	}
}


