//
//  ListTableViewController.swift
//  DemoPluggableVC
//
//  Created by Unmesh Rathod on 26/06/19.
//  Copyright © 2019 UnmeshRathod. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
	private var sampleData: [String] = []
	private var dataLoader = DataLoader()

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		loadItems()
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCell", for: indexPath)
		cell.textLabel?.text = sampleData[indexPath.row]
		return cell
	}

	// MARK: - PrivateMethods

	private func loadItems() {
		let loadingVC = LoadingViewController()
		add(loadingVC)

		dataLoader.loadItems { [weak self] items in
			loadingVC.remove()
			self?.sampleData = items
			self?.tableView?.reloadData()
		}
	}
}
