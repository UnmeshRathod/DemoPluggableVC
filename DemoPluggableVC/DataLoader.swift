//
//  DataLoader.swift
//  DemoPluggableVC
//
//  Created by Unmesh Rathod on 26/06/19.
//  Copyright © 2019 UnmeshRathod. All rights reserved.
//

import Foundation

protocol DataLoaderService: class {
	func loadItems(completionHandler: @escaping(([String]) -> Void))
}

class DataLoader: DataLoaderService {

	// Singleton object
	static let shared = DataLoader()
	private init() {}

	func loadItems(completionHandler: @escaping(([String]) -> Void)) {
		let sampleData = ["First", "Second", "Third", "Fourth"]

		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			completionHandler(sampleData)
			return
		}
	}
}
