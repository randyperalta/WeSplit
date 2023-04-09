//
//  ContentView.swift
//  WeSplit
//
//  Created by Randy Peralta on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron", "Albus", "Serverus", "Draco", "Voldemort"].sorted()
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        Form{
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(students, id: \.self) {
                    Text($0)
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
