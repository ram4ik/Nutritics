//
//  ContentView.swift
//  Nutritics
//
//  Created by Ramill Ibragimov on 30.08.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    @ObservedObject var manager = HttpAuth()
    
    var body: some View {
        Button(action: {
            self.manager.postAuth(username: self.username, password: self.password)
        }, label: {
            Text("Button")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
