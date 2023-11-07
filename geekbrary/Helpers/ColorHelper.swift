//
//  ColorHelper.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 07/11/2023.
//  Convert Pokemon Type String to Color

import SwiftUI

extension Color {
    static func pokemonTypeColor(for typeName: String) -> Color {
        switch typeName {
            case "normal": return Color(UIColor(hex: 0xA8A878))
            case "fighting": return Color(UIColor(hex: 0xC03028))
            case "flying": return Color(UIColor(hex: 0xA890F0))
            case "poison": return Color(UIColor(hex: 0xA040A0))
            case "ground": return Color(UIColor(hex: 0xE0C068))
            case "rock": return Color(UIColor(hex: 0xB8A038))
            case "bug": return Color(UIColor(hex: 0xA8B820))
            case "ghost": return Color(UIColor(hex: 0x705898))
            case "steel": return Color(UIColor(hex: 0xB8B8D0))
            case "fire": return Color(UIColor(hex: 0xF08030))
            case "water": return Color(UIColor(hex: 0x6890F0))
            case "grass": return Color(UIColor(hex: 0x78C850))
            case "electric": return Color(UIColor(hex: 0xF8D030))
            case "psychic": return Color(UIColor(hex: 0xF85888))
            case "ice": return Color(UIColor(hex: 0x98D8D8))
            case "dragon": return Color(UIColor(hex: 0x7038F8))
            case "dark": return Color(UIColor(hex: 0x705848))
            case "fairy": return Color(UIColor(hex: 0xEE99AC))
            case "unknown": return Color(UIColor(hex: 0x68A090))
            case "shadow": return Color(UIColor(hex: 0x5A5A5A))
            default: return .clear
        }
    }
}

// Create an extension to UIColor to convert hex colors
extension UIColor {
    convenience init(hex: Int) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255,
            blue: CGFloat(hex & 0x0000FF) / 255,
            alpha: 1
        )
    }
}
