//
//  PokemonDetailsView.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 07/11/2023.
//

import SwiftUI

struct PokemonDetailsView: View {
    var pokemon: PokemonDetails
    @State private var selectedTab = 0
    
    var body: some View {
                GeometryReader3D { geometry in
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Spacer()
                                Text(pokemon.name)
                                    .textCase(.uppercase)
                                    .fontWeight(.bold)
                                    .font(.title)
                                Text("#\(pokemon.id)")
                                    .fontWeight(.bold)
                                    .font(.title)
                                Spacer()
                            }
                            HStack {
                                ForEach(pokemon.types, id: \.self) { type in
                                    Text(type.type.name)
                                        .padding(16)
                                        .background(Color.pokemonTypeColor(for: type.type.name))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .cornerRadius(16)
                                }
                            }
                        }
                        RemoteImageView(imageURL: pokemon.sprites.front_default ?? "")
                            .frame(minWidth: geometry.size.height * 0.4, maxWidth: geometry.size.height * 0.5, minHeight: geometry.size.height * 0.4, maxHeight: geometry.size.height * 0.5)
                            .shadow(color: .gray, radius: 20)
                        Spacer()
                        
                }.frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                        .padding(geometry.size.height * 0.04)

                VStack(spacing: 10) {
                    HStack {
                        Spacer()
                        TabButton(title: "Stats", index: 0, selectedIndex: $selectedTab)
                        Spacer()
                        TabButton(title: "Moves", index: 1, selectedIndex: $selectedTab)
                        Spacer()
                        TabButton(title: "Abilities", index: 2, selectedIndex: $selectedTab)
                        Spacer()
                        TabButton(title: "Types", index: 3, selectedIndex: $selectedTab)
                        Spacer()
                    }
                    
                    TabView(selection: $selectedTab) {
                        StatsPage(pokemonStats: pokemon.stats)
                        MovesPage()
                        AbilitiesPage()
                        TypesPage()
                    }
                }
                .padding(EdgeInsets(top: geometry.size.height * 0.35, leading: 0, bottom: 0, trailing: 0))
            }
        }
}

//struct Stats: Decodable, Hashable {
//    var base_stat: Int
//    var stat: Stat
//}
//
//struct Stat: Decodable, Hashable {
//    var name: String
//    var url: String
//}


struct TabButton: View {
    var title: String
    var index: Int
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button(action: {
            self.selectedIndex = self.index
        }) {
            Text(title)
                .foregroundColor(.black)
        }.frame(width: 200)
    }
}

struct StatsPage: View {
    var pokemonStats: [Stats]
    
    // Calculate the total sum of stat values
    var totalStat: Int {
        pokemonStats.reduce(0) { $0 + $1.base_stat }
    }
    
    var body: some View {
        List {
            ForEach(pokemonStats, id: \.self) { stat in
                StatView(statName: stat.stat.name, statValue: stat.base_stat)
            }
            StatView(statName: "Total", statValue: totalStat)
        }
        .padding()
    }
}

struct MovesPage: View {
    var body: some View {
        Text("Moves")
            .foregroundColor(.black)
        .tag(1)    }
}

struct AbilitiesPage: View {
    var body: some View {
        Text("Abilities")
            .foregroundColor(.black)
        .tag(2)    }
}

struct TypesPage: View {
    var body: some View {
        Text("Types")
            .foregroundColor(.black)
        .tag(3)    }
}

struct StatView: View {
    let statName: String
    let statValue: Int
    
    var body: some View {
        HStack {
            Text("\(statName): \(statValue)")
                .fontWeight(.bold)
                .frame(width: 200, alignment: .leading)
            VStack {
                Spacer()
                ProgressBar(value: progressBarValue(for: statName), color: progressBarColor(for: statName))
                Spacer()
            }
        }
    }
    
    private func progressBarColor(for statName: String) -> Color {
        switch statName {
            case "hp":
                return .red
            case "attack":
                return .orange
            case "defense":
                return .yellow
            case "special-attack":
                return .blue
            case "special-defense":
                return .green
            case "speed":
                return .purple
            default:
                return .gray
        }
    }
    
    private func progressBarValue(for statName: String) -> Double {
        if statName.uppercased() == "TOTAL" {
            return Double(statValue) / 780
        } else {
            return Double(statValue) / 255
        }
    }
}


struct ProgressBar: View {
    var value: Double
    var color: Color
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width - 20, height: 20)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                    
                    Rectangle()
                        .frame(width: CGFloat(self.value) * geometry.size.width - 20, height: 20)
                        .foregroundColor(self.color)
                }
            }
        }
    }
}
