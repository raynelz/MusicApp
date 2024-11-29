//
//  ViewController.swift
//  MusicApp
//
//  Created by Захар Литвинчук on 29.11.2024.
//

import UIKit

final class ViewController: UIViewController {
	// MARK: - UI Elements

	private let backgroundView = UIImageView()
	private let titleLabel = UILabel()

	private let tableView = UITableView(frame: .zero, style: .insetGrouped)
	
	private let startButton = UIButton()
	private let descriptionLabel = UILabel()

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		embedViews()
		setupAppearance()
		setupLayout()
		setupBehavior()
		setupData()
	}
}

// MARK: - Private Methods

private extension ViewController {
	
	// MARK: - Embed Views
	func embedViews() {
		view.addSubview(backgroundView)
		backgroundView.addSubviews(titleLabel, tableView, startButton, descriptionLabel)
	}
	
	// MARK: - Setup Appearance
	func setupAppearance() {
		view.backgroundColor = .systemBackground

		backgroundView.contentMode = .scaleAspectFill
		backgroundView.isUserInteractionEnabled = true
		
		titleLabel.font = .systemFont(ofSize: 45, weight: .bold)
		titleLabel.textColor = .white
		titleLabel.numberOfLines = 0
		
		tableView.backgroundColor = .clear
		tableView.isScrollEnabled = false
		tableView.isUserInteractionEnabled = false
		
		startButton.setTitleColor(.white, for: .normal)
		startButton.backgroundColor = .systemBlue
		startButton.layer.cornerRadius = 20
		
		descriptionLabel.textColor = .black
		descriptionLabel.textAlignment = .center
		descriptionLabel.font = .systemFont(ofSize: 16, weight: .regular)
		descriptionLabel.numberOfLines = 0
	}
	
	// MARK: - Setup Layout

	func setupLayout() {
		view.translationToMaskOff(backgroundView, titleLabel, tableView, startButton, descriptionLabel)

		NSLayoutConstraint.activate([
			backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			
			tableView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
			tableView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
			tableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
			tableView.heightAnchor.constraint(equalToConstant: 400),
			
			startButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 60),
			startButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			startButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			startButton.heightAnchor.constraint(equalToConstant: 50),
			
			descriptionLabel.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 26),
			descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
		])
	}
	
	// MARK: - Setup Behavior

	func setupBehavior() {
		tableView.register(OnboardingViewCell.self, forCellReuseIdentifier: OnboardingViewCell.identifier)
		tableView.dataSource = self
		
		let buttonAction = UIAction { _ in
			print("Кнопка нажата! 👀")
		}
		
		startButton.addAction(buttonAction, for: .touchUpInside)
	}
	
	// MARK: - Setup Data

	func setupData() {
		backgroundView.image = UIImage(named: "bg")
		titleLabel.text = "Слушай музыку бесплатно!"
		startButton.setTitle("Начать!", for: .normal)
		descriptionLabel.text = "Попробуй 7 дней бесплатно, затем -\n149 руб/месяц или 1790 руб/год"
	}
}

extension ViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: OnboardingViewCell.identifier, for: indexPath) as? OnboardingViewCell else {
			return UITableViewCell()
		}
		let onboardingCellData = OnboardingMockData.tablecells[indexPath.section]
		cell.configure(with: onboardingCellData)
		return cell
	}
}

#Preview(traits: .portrait) {
	ViewController()
}
