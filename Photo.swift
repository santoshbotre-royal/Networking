//
//  Photo.swift
//  LowDataMode
//
//  Created by Santosh Botre on 12/20/19.
//  Copyright © 2019 Santosh Botre. All rights reserved.
//

import Foundation

struct Photo: Codable {
	let id: Int
	let title: String
	let url: String
	let thumbnailUrl: String
}

typealias Photos = [Photo]
