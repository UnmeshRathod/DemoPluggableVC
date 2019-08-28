//
//  ViewController.swift
//  DemoPluggableVC
//
//  Created by Unmesh Rathod on 26/06/19.
//  Copyright © 2019 UnmeshRathod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var vcPickerView: UIPickerView!

	var pickerElements: [String] = []
	var selectedType: TypeOfVC = .listView

	override func viewDidLoad() {
		super.viewDidLoad()

		vcPickerView.dataSource = self
		vcPickerView.delegate = self

		for element in TypeOfVC.allCases {
			pickerElements.append(element.rawValue)
		}
	}

	@IBAction func doneButtonClicked(_ sender: Any) {
		let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
		guard let listController = storyBoard.instantiateViewController(withIdentifier: "ListTableViewController") as? UIViewController else {
			return
		}
		(listController as? ListTableViewController)?.vcType = selectedType
		self.navigationController?.pushViewController(listController, animated: true)
	}
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {

	// MARK: - UIPickerViewDataSource

	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerElements.count
	}

	// MARK: - UIPickerViewDelegate

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerElements[row]
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let type = pickerElements[row]

		for element in TypeOfVC.allCases where type == element.rawValue {
			self.selectedType = element
			break
		}
	}
}
