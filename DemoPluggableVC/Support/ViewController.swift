//
//  ViewController.swift
//  DemoPluggableVC
//
//  Created by Unmesh Rathod on 26/06/19.
//  Copyright © 2019 UnmeshRathod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
		guard let listController = storyBoard.instantiateViewController(withIdentifier: "ListTableViewController") as? UIViewController else {
			return
		}

		self.navigationController?.pushViewController(listController, animated: true)
	}
}
