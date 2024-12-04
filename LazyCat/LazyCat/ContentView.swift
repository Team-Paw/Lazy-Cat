//
//  ContentView.swift
//  LazyCat
//
//  Created by 김민지 on 10/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TopBarView()
    }
}
 
struct MainView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Main Content")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
