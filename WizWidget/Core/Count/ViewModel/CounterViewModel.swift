//
//  CounterViewModel.swift
//  wizDemo2
//
//  Created by Nitin on 04/04/25.
//


import Foundation
import WidgetKit

class CounterViewModel: ObservableObject {
    // here we are making a UserDefaults suite that is shared with the widget
    static let appGroup = SharedData.appGroup
    static let userDefaults = UserDefaults(suiteName: appGroup)!
    
    static let streakCountKey = SharedData.streakCountKey
    
    @Published var streakCount: Int {
        didSet {
            // Save to UserDefaults when value changes
            CounterViewModel.userDefaults.set(streakCount, forKey: CounterViewModel.streakCountKey)
            // reloading tehe visit when streakcount changes
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    
    init() {
        streakCount = CounterViewModel.userDefaults.integer(forKey: CounterViewModel.streakCountKey)
    }
    
    // Basic function for incrementing and decrementing the count from the main app view
    func increment() {
        streakCount += 1
    }
    
    func decrement() {
        if streakCount > 0 {
            streakCount -= 1
        }
    }
}
