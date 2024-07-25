//
//  TableView.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-25.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    var city: String
    let birthDate: Date
    var children = [Person]()

    // some example websites
    static let betsy = Person(name: "Betsy Appleseed", city: "San Jose", birthDate: ISO8601DateFormatter().date(from: "1977-01-30T11:28:00+00:00")!)
    static let kate = Person(name: "Kate Appleseed", city: "Los Altos", birthDate: ISO8601DateFormatter().date(from: "1977-02-25T04:15:00+00:00")!)
    static let johnny = Person(name: "Johnny Appleseed", city: "Santa Clara", birthDate: ISO8601DateFormatter().date(from: "1952-06-03T12:45:00+00:00")!, children: [betsy, kate])
    static let tim = Person(name: "Tim Appleseed", city: "Mountain View", birthDate: ISO8601DateFormatter().date(from: "1960-11-01T09:41:00+00:00")!)
}


struct TableView: View {
    let family = [Person.johnny, Person.tim]
    
    @State private var bookmarksExpanded = false
    
    var body: some View {
        Table(of: Person.self) {
            TableColumn("Name", value: \.name)
            TableColumn("City", value: \.city)
            TableColumn("BirthDate") { person in
                Text(person.birthDate.formatted(date: .numeric, time: .omitted))
            }
        } rows: {
            ForEach(family) { member in
                if member.children.isEmpty {
                    TableRow(member)
                } else {
                    DisclosureTableRow(member) {
                        ForEach(member.children)
                    }
                }
            }
        }

    }
}

#Preview {
    TableView()
}
