//
//  CommentsViewModel.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

/// CommentsViewModel
class CommentsViewModel {
	let commentRequestHandler: RequestingComments
	var comments: Comments?
	
	init(commentRequestHandler: RequestingComments) {
		self.commentRequestHandler = commentRequestHandler
	}
	
	func comments(_ completion: @escaping (Result<Bool, Error>) -> Void) {
		self.commentRequestHandler.comments({ [weak self] result in
			switch result {
			case .success(let comments):
				self?.comments = comments
				completion(.success(true))
			case .failure(let error):
				completion(.failure(error))
			}
		})
	}
}
