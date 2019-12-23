//
//  CommentRequestHandler.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

protocol RequestingComments {
	func comments(_ completion: @escaping (Result<Comments, Error>) -> Void)
}

struct CommentRequestHandler: RequestingComments {
	var network: Networking
	init(network: Networking) {
		self.network = network
	}
	
	func comments(_ completion: @escaping (Result<Comments, Error>) -> Void) {
		network.request(Endpoint.comments, completion: completion)
	}
}
