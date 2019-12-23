//
//  ViewController.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import UIKit
import Network

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		// Approach 1
//		let requestPosts = PostViewModel(network: NetworkManager())
//		requestPosts.getPosts { result in
//			switch result {
//			case .success(let posts):
//				dump(posts)
//			case .failure(let error):
//				dump(error)
//			}
//		}
//
		
/*
		// Apporach 2
		let requestPost = PostsViewModel(
			postRequestHandler: PostRequestHandler(
				network: NetworkManager()
			) // PostRequestHandler
		) // PostsViewModel
		
		requestPost.getPosts { result in
			switch result {
			case .success(let bool):
				dump(bool)
				dump(requestPost.posts)
			case .failure(let error):
				dump(error)
			}
		}
*/

		/*
		// Comments
		let requestComments = CommentsViewModel(
			commentRequestHandler: CommentRequestHandler(
				network: NetworkManager()
			) // CommentRequestHandler
		) // CommentsViewModel
		
		requestComments.comments( ){ result in
			switch result {
			case .success(let bool):
				dump(bool)
				dump(requestComments.comments)
			case .failure(let error):
				dump(error)
			}
		}
*/
	
		/*
		// Photos
		let requestPhotos = PhotoViewModel(
			photosRequestHandler: PhotoRequestHandler(
				network: NetworkManager()
			) // PhotoRequestHandler
		) // PhotoViewModel
		
		requestPhotos.photo() { result in
			switch result {
			case .success(let bool):
				dump(bool)
				dump(requestPhotos.photos)
			case .failure(let error):
				dump(error)
			}
		}
*/
		let networkStatus = NWPathMonitor().currentPath
		if networkStatus.isConstrained {
			print("Network in not constrained")
		} else {
			print("Constrained Network = \(networkStatus.isConstrained ) Is it expensive = \(networkStatus.isExpensive)")
			print("Constrained Network \(networkStatus.status)")
			print("Constrained Network Supports IPv4 \(networkStatus.supportsIPv4)")
			print("Constrained Network Supports IPv6 \(networkStatus.supportsIPv6)")
		}
		
		loadData()
	}
}


/* By setting urlRequest to false on the URLRequest. We said we are support Low Power Mode
	It will fail the execute URLRequest with
	URLError -> networkUnavailableReason property set to .constrained
*/
//urlRequest.allowsConstrainedNetworkAccess = false

extension ViewController {
	func loadData() {
		guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
			preconditionFailure("The requesting endpoint (\(self)) has incorrect url..")
		}
		var urlRequest = URLRequest(url: url)

		/* By setting urlRequest to false on the URLRequest. We said we are support Low Power Mode.
			It will fail the execute URLRequest with
			URLError -> networkUnavailableReason property set to .constrained
		*/
		urlRequest.allowsConstrainedNetworkAccess = false
		//urlRequest.allowsCellularAccess = false
		//urlRequest.allowsExpensiveNetworkAccess = false
		print("networkServiceType = \(urlRequest.networkServiceType.rawValue)")
		URLSession.shared.dataTask(with: urlRequest) { data, response, error in
			do {
				if let error = error { dump(error)
					return
				}
				guard let data = data else {
					preconditionFailure("Data is not received neither error...")
				}
				let decodedObject = try JSONDecoder().decode(Posts.self, from: data)
				dump(decodedObject)
			} catch {
				dump(error)
			}
		}.resume()
	}
}
