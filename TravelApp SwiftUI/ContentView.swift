//
//  ContentView.swift
//  TravelApp SwiftUI
//
//  Created by Murad Yarmamedov on 07.01.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var path = [DestinationModel]()
    @State private var sortOrder = SortDescriptor(\DestinationModel.date)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("TravelTracer")
                .navigationDestination(for: DestinationModel.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add Destination", systemImage: "plus", action: addDestination)
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\DestinationModel.name))
                            Text("Priority")
                                .tag(SortDescriptor(\DestinationModel.priority, order: .reverse))
                            Text("Date")
                                .tag(SortDescriptor(\DestinationModel.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addDestination() {
        let destination = DestinationModel()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
}

