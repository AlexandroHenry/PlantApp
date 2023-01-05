//
//  CustomerCorner.swift
//  PlantApp
//
//  Created by Seungchul Ha on 2023/01/05.
//

import SwiftUI

struct CustomerCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
