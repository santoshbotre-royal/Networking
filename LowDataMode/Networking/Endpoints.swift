//
//  Endpoints.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

enum Endpoint {
	case posts
	case comments
	case photos
}

extension Endpoint: Requesting {
	var urlRequest: URLRequest {
		switch self {
		case .posts:
			guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
				preconditionFailure("The requesting endpoint (\(self)) has incorrect url..")
			}
			return URLRequest(url: url)
		case .comments:
			guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
				preconditionFailure("The requesting endpoint (\(self)) has incorrect url..")
			}
			return URLRequest(url: url)

			case .photos:
				guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
					preconditionFailure("The requesting endpoint (\(self)) has incorrect url..")
				}
				return URLRequest(url: url)
		}
	}
}
