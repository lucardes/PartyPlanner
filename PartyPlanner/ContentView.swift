//
//  ContentView.swift
//  PartyPlanner
//
//  Created by SERGIO J RAFAEL ORDINE on 23/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        EventView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
