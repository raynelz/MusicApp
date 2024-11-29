//
//  OnboardingMockData.swift
//  MusicApp
//
//  Created by Захар Литвинчук on 29.11.2024.
//

import Foundation

struct OnboardingMockData {
	static let tablecells: [OnboardingCellModel] = [
		.init(icon: "lock.circle.fill", title: "Сегодня - бесплатный доступ", subtitle: "Наслаждайся 1000+ музыки и подкастов"),
		.init(icon: "bell.circle.fill", title: "День 5 - напоминание", subtitle: "Мы отправим тебе уведомление, чтобы напомнить, когда заканчивается твой бесплатный период"),
		.init(icon: "checkmark.seal.fill", title: "День 7 - окончание бесплатного периода", subtitle: "Твоя подписка начнёт действовать. Ты сможешь легко отменить её после этого дня.")
	]
}
