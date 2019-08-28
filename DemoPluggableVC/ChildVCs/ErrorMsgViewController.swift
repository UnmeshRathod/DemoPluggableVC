//
//  ErrorMsgViewController.swift
//  DemoPluggableVC
//
//  Created by Unmesh Rathod on 28/08/19.
//  Copyright © 2019 UnmeshRathod. All rights reserved.
//

import UIKit

class ErrorMsgViewController: UIViewController {
	var type: MsgType = .defaultMsg
	weak var delegate: ErrorMsgVCActionDelegate?

	override func viewDidLoad() {
		super.viewDidLoad()

		showErrorAlert()
	}

	func showErrorAlert() {
		let alertController = UIAlertController.init(title: nil, message: type.rawValue, preferredStyle: .alert)
		let okButton = UIAlertAction.init(title: "Ok", style: .default, handler: { _ in
			self.delegate?.okButtonClicked()
		})

		let cancelButton = UIAlertAction.init(title: "Cancel", style: .default, handler: { _ in
			self.delegate?.cancelButtonClicked()
		})

		alertController.addAction(okButton)
		alertController.addAction(cancelButton)

		topViewController()?.present(alertController, animated: true, completion: {
			self.delegate?.viewDismissed()
		})
	}

	fileprivate func topViewController(rootViewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

		if let navigationController = rootViewController as? UINavigationController {
			return topViewController(rootViewController: navigationController.visibleViewController)
		}

		if
			let tabController = rootViewController as? UITabBarController,
			let selected = tabController.selectedViewController {
			return topViewController(rootViewController: selected)
		}

		if
			let alert = rootViewController as? UIAlertController,
			let presenting = alert.presentingViewController {
			return presenting
		}

		if let presented = rootViewController?.presentedViewController {
			return topViewController(rootViewController: presented)
		}
		return rootViewController
	}
}

protocol ErrorMsgVCActionDelegate: class {
	func okButtonClicked()
	func cancelButtonClicked()
	func viewDismissed()
}

extension ErrorMsgViewController {
	enum MsgType: String {
		case noInternet = "You're not connected to internet!"
		case noItems = "There are no items in this list."
		case defaultMsg = "Something went wrong!"
	}
}
