//
//  SignInView.swift
//  WhyIsn'tWorking
//
//  Created by A_Mcflurry on 4/11/24.
//

import UIKit
import SnapKit

final class SignInView: BaseUIView {
	private let signUpLabelsView = SignUpLabelsView()

	override func configureHierarchy() {
		[signUpLabelsView].forEach { addSubview($0) }
	}

	override func configureLayout() {
		signUpLabelsView.snp.makeConstraints {
			$0.top.equalTo(self.safeAreaLayoutGuide)
			$0.horizontalEdges.equalTo(self).inset(20)
		}
	}

	override func configureView() {
		signUpLabelsView.mainLabel.text = "품격있는 개발자들의\n커뮤니티"
		signUpLabelsView.subLabel.text = "로그인 또는 회원가입을 해주세요."
	}
}
