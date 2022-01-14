//
//  HapticsManager.swift
//  Stonks
//
//  Created by Андрей Воробьев on 29.12.2021.
//

import Foundation
import UIKit

/// Object to manage haptics
final class HapticsManager {
    /// Singleton
    static let shared = HapticsManager()
    /// Private constructor
    private init() {}

//MARK: - Public
    
    /// Vibrate slightly for selections
    public func vibrateForSelection() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
    
    /// Play haptic for a given type interaction
    /// - Parameter type: Type to vibrate for
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
}
