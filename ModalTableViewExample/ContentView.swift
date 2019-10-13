//
//  ContentView.swift
//  ModalTableViewExample
//
//  Created by Lea Marolt Sonnenschein on 13/10/2019.
//  Copyright © 2019 Lea Marolt Sonnenschein. All rights reserved.
//

import SwiftUI

private struct Content: Identifiable, Hashable {
  let description: String
  let id: Int
}

private let content = Array(0...30).map { Content(description: "Name is: \($0)", id: $0) }

struct ContentView: View {
  @State var isPresenting: Bool = false
  var body: some View {
    List {
      ForEach(content, id: \.self) { piece in
        Text(piece.description)
          .onTapGesture {
            self.isPresenting = true
        }
        .sheet(isPresented: self.$isPresenting) {
          Text("My id is \(piece.id)")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
