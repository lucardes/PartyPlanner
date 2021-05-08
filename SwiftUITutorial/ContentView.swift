//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by
//

import SwiftUI

struct ContentView: View {
    @StateObject var eventController = EventController()
    var body: some View {
        EventListView(observedObject: eventController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}

