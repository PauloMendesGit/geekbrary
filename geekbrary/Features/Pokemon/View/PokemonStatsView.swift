//
//  PokemonStatsView.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 18/11/2023.
//

import SwiftUI

struct PokemonStatsView: View {
    var pokemonStats: [Stats]
    
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
