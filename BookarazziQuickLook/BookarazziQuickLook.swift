//
//  BookarazziQuickLook.swift
//  BookarazziQuickLook
//
//  Created by Jeandré De Villiers on 2021/10/29.
//

import WidgetKit
import SwiftUI
import Intents


extension Color {
    static let ui = Color.UI()
    
    struct UI {
        let beige = Color("BeigeAccent")
        let yellow = Color("YellowAccent")
        let black = Color("BlackAccent")
        let grey = Color("GreyAccent")
        let orange = Color("OrangeAccent")
        let white = Color("WhiteAccent")
    }
}

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct BookarazziQuickLookEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            
            Color.ui.beige.ignoresSafeArea(.all)
        VStack(alignment: .center, spacing: 10){
            
            Text("Time for Bookarazzi!")
                .frame(width: 100, height: 45, alignment: .center)
                .font(.custom("Roboto-Black", size: 15))
            
            Text(entry.date, style: .time)
                .font(.custom("Montserrat-Thin", size: 15))
                
                        Image("book (1)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.vertical, 3)
                    }
                }
}
}
        
@main
struct BookarazziQuickLook: Widget {
    let kind: String = "BookarazziQuickLook"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in BookarazziQuickLookEntryView(entry: entry)
                .background(Color.ui.beige)
                .edgesIgnoringSafeArea(.all)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct BookarazziQuickLook_Previews: PreviewProvider {
    static var previews: some View {
        BookarazziQuickLookEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .preferredColorScheme(.light)
            .environment(\.sizeCategory, .small)
            .padding(.all)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
