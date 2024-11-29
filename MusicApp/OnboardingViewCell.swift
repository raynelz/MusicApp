//
//  OnboardingViewCell.swift
//  MusicApp
//
//  Created by Захар Литвинчук on 29.11.2024.
//

import UIKit

final class OnboardingViewCell: UITableViewCell {
	
	static let identifier: String = "OnboardingViewCell"
	// MARK: - UI Components
	
	private let containerView = UIView()
	private let iconImageView = UIImageView()
	private let titleLabel = UILabel()
	private let subtitleLabel = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		embedViews()
		setupAppearance()
		setupLayout()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with model: OnboardingCellModel) {
		self.iconImageView.image = UIImage(systemName: model.icon)
		self.titleLabel.text = model.title
		self.subtitleLabel.text = model.subtitle
	}
}

private extension OnboardingViewCell {
	func embedViews() {
		addSubview(containerView)
		containerView.addSubviews(iconImageView, titleLabel, subtitleLabel)
	}
	
	func setupAppearance() {
		backgroundColor = .clear
		selectionStyle = .none
		
		containerView.backgroundColor = .white.withAlphaComponent(0.9)
		containerView.layer.cornerRadius = 20
		containerView.layer.masksToBounds = true
		
		iconImageView.contentMode = .scaleAspectFit
		
		titleLabel.font = .systemFont(ofSize: 13, weight: .bold)
		titleLabel.textColor = .black
		titleLabel.numberOfLines = 0
		
		subtitleLabel.font = .systemFont(ofSize: 11, weight: .regular)
		subtitleLabel.textColor = .systemGray
		subtitleLabel.numberOfLines = 0
	}
	
	func setupLayout() {
		translationToMaskOff(
			containerView,
			iconImageView,
			titleLabel,
			subtitleLabel
		)
		
		NSLayoutConstraint.activate([
			containerView.topAnchor.constraint(equalTo: topAnchor),
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
			iconImageView.heightAnchor.constraint(equalToConstant: 38),
			iconImageView.widthAnchor.constraint(equalToConstant: 38),
			
			titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14),
			titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
			
			subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
			subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			subtitleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
		])
	}
}
