//
//  MainTemp.swift
//  LiftingApp
//
//  Created by Kevin Bates on 1/8/24.
//

import SwiftUI

struct MainTemp: View {
    @ObservedObject private var routineList: RoutineList
    
    init() {
        /*
        if let data = UserDefaults.standard.data(forKey: "ExampleUser") {
            if let decoded = try? JSONDecoder().decode(RoutineList.self, from: data) {
                routineList = decoded
                return
            }
        }*/
        if let loadedData: RoutineList = load(key: "ExampleUser") {
            routineList = loadedData
        } else {
            routineList = RoutineList(user: "ExampleUser")
            routineList.save()
        }
    }
    
    init(routineList: RoutineList) {
        self.routineList = routineList
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Routines")
                    .bold()
                    .scaledToFit()
                Spacer()
                List(routineList.routines.indices, id: \.self) { index in
                    /*
                    if let data = UserDefaults.standard.data(forKey: routineList.routines[index].id.uuidString) {
                        if let loadedRoutine = try? JSONDecoder().decode(Routine.self, from: data) {
                            NavigationLink(destination: EditRoutineView(curRoutine: loadedRoutine, routineList: routineList)) {
                                Text(loadedRoutine.name)
                            }
                        }
                    }
                     */
                    if let loadedRoutine:Routine = load(key: routineList.routines[index].id.uuidString) {
                        NavigationLink(destination: EditRoutineView(curRoutine: loadedRoutine, routineList: routineList)) {
                            Text(loadedRoutine.name)
                        }
                    }
                }
                Spacer()
                Button (action: {
                    routineList.routines.append(Routine())
                    save()
                }, label: {
                    Text("+ routine")
                        .font(.title2)
                        .foregroundColor(Color("Background"))
                        .bold()
                })
                .frame(alignment: .topLeading)
                .padding()
                Spacer()
            }
        }
    }
    
    
    func save() {
        if let encoded = try? JSONEncoder().encode(routineList) {
            UserDefaults.standard.set(encoded, forKey: "ExampleUser")
        }
    }
}

struct MainTemp_Previews: PreviewProvider {
    static var previews: some View {
        MainTemp()
    }
}
