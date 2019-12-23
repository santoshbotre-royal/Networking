//
//  PostViewModel.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

class PostViewModel: RequestingPosts {
	var network: Networking
	private var _post: Posts?
	
	init(network: Networking) {
		self.network = network
	}
}

class PostsViewModel {
	let postRequestHandler: RequestingPosts
	var posts: Posts?
	
	init(postRequestHandler: RequestingPosts) {
		self.postRequestHandler = postRequestHandler
	}
	
	func getPosts(_ completion: @escaping (Result<Bool, Error>) -> Void) {
		self.postRequestHandler.getPosts( { [weak self] result in
			switch result {
			case .success(let posts):
				self?.posts = posts
				completion(.success(true))
			case .failure(let error):
				completion(.failure(error))
			}
		})
	}
}
