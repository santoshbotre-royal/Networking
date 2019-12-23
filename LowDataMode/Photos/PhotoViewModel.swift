//
//  PhotoViewModel.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

class PhotoViewModel {
		let photosRequestHandler: RequestingPhoto
		var photos: Photos?
		
		init(photosRequestHandler: RequestingPhoto) {
			self.photosRequestHandler = photosRequestHandler
		}
		
		func photo(_ completion: @escaping (Result<Bool, Error>) -> Void) {
			self.photosRequestHandler.photos( { [weak self] result in
				switch result {
				case .success(let photos):
					self?.photos = photos
					completion(.success(true))
				case .failure(let error):
					completion(.failure(error))
				}
			})
		}

}
