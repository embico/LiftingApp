//
//  CreateExerciseView.swift
//  LiftingApp
//
//  Created by Kevin Bates on 8/28/24.
//

import SwiftUI

struct CreateExerciseView: View {
    @State var exercise: Exercise = Exercise(name: "", desc: "")
    var body: some View {
        ScrollView {
            VStack {
                Text("Exercise Name")
                TextField("name", text: $exercise.name)
            }
            Spacer()
            VStack {
                Text("Description")
                TextField("description", text: $exercise.desc)
            }
            VStack {
                Button(action: {
                    
                }, label: {
                    Text("Save")
                })
            }
            Spacer()
        }
    }
}

#Preview {
    CreateExerciseView()
}
