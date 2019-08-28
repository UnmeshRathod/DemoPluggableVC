//
//  ListTableViewController.swift
//  DemoPluggableVC
//
//  Created by Unmesh Rathod on 26/06/19.
//  Copyright © 2019 UnmeshRathod. All rights reserved.
//

import UIKit

enum TypeOfVC: String, CaseIterable {
	case listView = "Sample ListView"
	case errorView = "Sample ErrorView"
}

class ListTableViewController: UITableViewController {
	private var sampleData: [String] = []
	var vcType: TypeOfVC = .listView

	var errorMsgController: ErrorMsgViewController?

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

		errorMsgController = ErrorMsgViewController()
		errorMsgController?.type = .noItems
		errorMsgController?.delegate = self

		add(loadingVC)

		DataLoader.shared.loadItems { [weak self] items in
			loadingVC.remove()

			guard self != nil else { return }

			switch self!.vcType {
			case .listView:
				self!.sampleData = items
				self!.tableView?.reloadData()

			case .errorView:
				self!.add(self!.errorMsgController!)
			}
		}
	}
}

extension ListTableViewController: ErrorMsgVCActionDelegate {
	func okButtonClicked() {

	}

	func cancelButtonClicked() {

	}

	func viewDismissed() {
		errorMsgController?.remove()
	}
}
