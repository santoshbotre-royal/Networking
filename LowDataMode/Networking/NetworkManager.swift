//
//  NetworkManager.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

protocol Networking {
	func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

extension Networking {
	func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
		var urlRequest = endpoint.urlRequest
		
		/* By setting urlRequest to false on the URLRequest. We said we are support Low Power Mode
			It will fail the execute URLRequest with
			URLError -> networkUnavailableReason property set to .constrained
		*/
		
		urlRequest.allowsConstrainedNetworkAccess = false
		
		URLSession.shared.dataTask(with: urlRequest) { data, response, error in
			do {
				if let error = error {
					completion(.failure(error))
					return
				}
				
				guard let data = data else {
					preconditionFailure("Data is not received neither error...")
				}
				
				let decodedObject = try JSONDecoder().decode(T.self, from: data)
				completion(.success(decodedObject))
			} catch {
				completion(.failure(error))
			}
		}.resume()
	}
}

struct NetworkManager: Networking {
	// Do some custom implementation if required
}


