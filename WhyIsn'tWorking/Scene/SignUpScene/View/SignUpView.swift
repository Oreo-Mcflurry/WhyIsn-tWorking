//
//  SignUpView.swift
//  WhyIsn'tWorking
//
//  Created by A_Mcflurry on 4/11/24.
//

import UIKit
import SnapKit
import TextFieldEffects

final class SignUpView: BaseUIView {
	private let scrollView = UIScrollView()
	private let contentView = UIView()

	let mainLabel = UILabel()
	let subLabel = UILabel()
	private let signUpStackView = UIStackView()

	let textFields = [SignUpTextField(), SignUpTextField(), SignUpTextField(), SignUpTextField()]

	override func configureHierarchy() {
		[scrollView].forEach { addSubview($0) }
		[contentView].forEach { scrollView.addSubview($0) }
		[mainLabel, subLabel, signUpStackView].forEach { contentView.addSubview($0) }
	}

	override func configureLayout() {
		scrollView.snp.makeConstraints {
			$0.edges.equalTo(self.safeAreaLayoutGuide)
		}

		contentView.snp.makeConstraints {
			$0.verticalEdges.equalTo(scrollView).inset(20)
			$0.width.equalTo(scrollView)
		}

		mainLabel.snp.makeConstraints {
			$0.top.horizontalEdges.equalTo(contentView).inset(20)
		}

		subLabel.snp.makeConstraints {
			$0.top.equalTo(mainLabel.snp.bottom).offset(20)
			$0.horizontalEdges.equalTo(contentView).inset(20)
		}

		signUpStackView.snp.makeConstraints {
			$0.top.equalTo(subLabel.snp.bottom).offset(20)
			$0.horizontalEdges.bottom.equalTo(contentView).inset(20)
		}
	}

	override func configureView() {
		mainLabel.numberOfLines = 2
		mainLabel.font = .boldSystemFont(ofSize: 30)

		subLabel.numberOfLines = 2
		subLabel.textColor = .gray


		textFields[2].isSecureTextEntry = true

		textFields[0].placeholder = "전화번호를 입력해주세요"
		textFields[1].placeholder = "사용하실 닉네임을 입력해주세요"
		textFields[2].placeholder = "비밀번호를 입력해주세요"
		textFields[3].placeholder = "이메일을 입력해주세요"

		signUpStackView.axis = .vertical
		signUpStackView.spacing = 20
		signUpStackView.distribution = .equalSpacing

		for item in textFields {
			signUpStackView.addArrangedSubview(item)

			item.snp.makeConstraints { $0.height.equalTo(60) }
			item.isHidden = true
		}
	}


	func nextTextField(_ nextIndex: Int) {
		for item in textFields { item.borderActiveColor = .gray }
		UIView.animate(withDuration: 0.2) {
			self.textFields[nextIndex].isHidden = false
			self.textFields[nextIndex].becomeFirstResponder()
		}
	}
}