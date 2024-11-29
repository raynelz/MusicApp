//
//  UIView+AddSubviews.swift
//  MusicApp
//
//  Created by Захар Литвинчук on 29.11.2024.
//

import UIKit

extension UIView {
	func addSubviews(_ views: UIView...) {
		views.forEach { addSubview($0) }
	}
	
	func translationToMaskOff(_ views: UIView...) {
		views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
	}
}
