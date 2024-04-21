//
//  EventsTableViewCell.swift
//  DevCommunity
//
//  Created by A_Mcflurry on 4/19/24.
//

import UIKit
import SnapKit
import Kingfisher

final class EventsTableViewCell: BaseTableViewCell {
	private let eventsImageView = UIImageView()
	private let organizerLabel = UILabel()
	private let eventTitleLabel = UILabel()
	private let dDayLabel = UILabel()
	private let timeDiscriptionLabel = UILabel()
	private let timeLabel = UILabel()
	private let hashTagsLabel = UILabel()

	override func configureHierarchy() {
		[eventsImageView, organizerLabel, eventTitleLabel, dDayLabel, timeDiscriptionLabel, timeLabel, hashTagsLabel].forEach { addSubview($0) }
	}

	override func configureLayout() {
		eventsImageView.snp.makeConstraints {
			$0.top.horizontalEdges.equalTo(self).inset(20)
			$0.height.equalTo(eventsImageView.snp.width).dividedBy(1.618)
		}

		organizerLabel.snp.makeConstraints {
			$0.top.equalTo(eventsImageView.snp.bottom).offset(20)
			$0.horizontalEdges.equalTo(self).inset(20)
		}

		eventTitleLabel.snp.makeConstraints {
			$0.top.equalTo(organizerLabel.snp.bottom).offset(20)
			$0.leading.equalTo(self).inset(20)
		}

		dDayLabel.snp.makeConstraints {
			$0.top.bottom.equalTo(eventTitleLabel)
			$0.leading.equalTo(eventTitleLabel.snp.trailing).offset(20)
			$0.trailing.greaterThanOrEqualTo(self).inset(20)
		}

		timeDiscriptionLabel.snp.makeConstraints {
			$0.top.equalTo(eventTitleLabel.snp.bottom).offset(20)
			$0.leading.equalTo(self).offset(20)
		}

		timeLabel.snp.makeConstraints {
			$0.top.bottom.equalTo(timeDiscriptionLabel)
			$0.leading.equalTo(timeDiscriptionLabel.snp.trailing).offset(20)
			$0.trailing.equalTo(self).inset(20)
		}

		hashTagsLabel.snp.makeConstraints {
			$0.top.equalTo(timeDiscriptionLabel.snp.bottom).offset(20)
			$0.leading.trailing.equalTo(self).inset(20)
			$0.bottom.equalTo(self).inset(20)
		}
	}

	func configureCell(_ data: EventPost) {
		KingfisherManager.shared.setHeaders()
		eventsImageView.kf.setImage(with: data.imageURL)
		organizerLabel.text = data.organizer
		eventTitleLabel.text = data.title
		dDayLabel.text = data.dDay
		hashTagsLabel.text = data.hashTags
	}
}
