//
//  CounterWidgets.swift
//  CounterWidgets
//
//  Created by Nitin on 04/04/25.
//

import WidgetKit
import SwiftUI

// This is the main widget view
struct Provider: TimelineProvider {
    // Here we access the shared Userdefaults values
    let userDefaults = CounterViewModel.userDefaults
    
    func placeholder(in context: Context) -> SimpleEntry {
        // here we getting the streak count from UserDefaults
        let count = userDefaults.integer(forKey: CounterViewModel.streakCountKey)
        return SimpleEntry(date: .now, count: count, img: Image(systemName: "flame.fill"), imageName: "cute")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        // here i am getting streak count from UserDefaults
        let count = userDefaults.integer(forKey: CounterViewModel.streakCountKey)
        let entry = SimpleEntry(date: .now, count: count, img: Image(systemName: "flame.fill"), imageName: "cute")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let count = userDefaults.integer(forKey: CounterViewModel.streakCountKey)
        
        // Making a single entry with the current count
        let entry = SimpleEntry(
            date: .now,
            count: count,
            img: Image(systemName: "flame.fill"),
            imageName: "cute"
        )
        
        // Make the timeline refresh every 15 minutes
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
        
        completion(timeline)
    }
    
}

// Entry struct for the widget
struct SimpleEntry: TimelineEntry {
    let date: Date
    let count: Int
    let img: Image
    let imageName: String
}

// Main UI of widget view
struct CounterWidgetsEntryView: View {
    var entry: Provider.Entry
    
    var body: some View {
        
        VStack {
                if entry.count == 0 {
                    HStack{
                        Text("\(entry.img)")
                            .font(.system(size: 35))
                            .foregroundStyle(entry.count == 0 ? .white : .yellow)
                    
                        Text("\(entry.count)")
                            .font(.system(size: 42))
                            .foregroundStyle(.white)
                            .bold()
                    }
                    Text("I am not okay")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .bold()
                } else {
                    HStack{
                        Text("\(entry.img)")
                            .font(.system(size: 35))
                            .foregroundStyle(entry.count == 0 ? .pink : .yellow)
                        
                        Text("\(entry.count)")
                            .font(.system(size: 42))
                            .foregroundStyle(.white)
                            .bold()
                    }
                    Text("You did it")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .bold()
                }
            
            
            Image(entry.imageName)
                .resizable()
                .scaledToFit()
                .offset(y: 12)
                .scaleEffect(3.2)
        }
    }
}

// Main widget struct
struct CounterWidgets: Widget {
    let kind: String = "CounterWidgets"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                CounterWidgetsEntryView(entry: entry)
                    .containerBackground(entry.count == 0 ? Color.gray : Color.orangee, for: .widget)
            } else {
                CounterWidgetsEntryView(entry: entry)
                    .padding()
                    .background(entry.count == 0 ? Color.gray : Color.orangee)
            }
        }
        .configurationDisplayName("Streak Counter")
        .description("Shows your current streak count")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    CounterWidgets()
} timeline: {
    SimpleEntry(date: .now, count: 0, img: Image(systemName: "flame.fill"), imageName: "cute")
}
