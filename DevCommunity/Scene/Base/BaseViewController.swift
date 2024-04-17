//
//  BaseViewController.swift
//  SmartPush
//
//  Created by A_Mcflurry on 2/14/24.
//

import UIKit
import Toast

class BaseViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		configureBinding()
	}
	
	func configureHierarchy() { }
	func configureLayout() { }
	func configureView() { }
	func configureBinding() { }

	enum ToastKind: String {
		case loginError = "로그인 정보가 없습니다."
		case loginSuccess = "로그인 성공!"
		case signUp = "회원가입 성공!"
	}

	func showToast(_ message: ToastKind) {
		self.view.makeToast(message.rawValue)
	}

	deinit {
		print("Deinit")
	}
}