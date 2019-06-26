//
//  LoadingViewController.swift
//  DemoPluggableVC
//
//  Created by Unmesh Rathod on 26/06/19.
//  Copyright © 2019 UnmeshRathod. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
	private lazy var activityIndicator = UIActivityIndicatorView.init(style: .gray)

	override func viewDidLoad() {
		super.viewDidLoad()

		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(activityIndicator)

		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
			])
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		activityIndicator.startAnimating()
	}
}
