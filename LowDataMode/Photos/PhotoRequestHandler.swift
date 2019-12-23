//
//  PhotoRequestHandler.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

protocol RequestingPhoto {
	func photos(_ completion: @escaping (Result<Photos, Error>) -> Void)
}

struct PhotoRequestHandler: RequestingPhoto {	
	var network: Networking
	init(network: Networking) {
		self.network = network
	}
	
	func photos(_ completion: @escaping (Result<Photos, Error>) -> Void) {
		network.request(Endpoint.photos, completion: completion)
	}
}
