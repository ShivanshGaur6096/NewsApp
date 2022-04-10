//
//  AccessibilityProtocols.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 10/04/22.
//

protocol VoiceOverAccessible {
    /// Perform initial setup of accessibility such as enabling/disabling accessibility
    func setupAccessibility()
    /// Assign identifier to all the accessibile views
    func assignAccessibilityIds()
    /// Update lables of all the accessibility views
    func updateAccessibilityLabels()
}

extension VoiceOverAccessible {
    /// Helper method to call once in viewDidLoad or awakeFromNib or didMoveToSuperView
    func applyAccessibility() {
        setupAccessibility()
        assignAccessibilityIds()
        updateAccessibilityLabels()
    }
}
