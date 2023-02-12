//
//  SwiftUIView.swift
//  Slot Machine
//
//  Created by Mohammed Mubashir on 12/02/23.
//

import SwiftUI

struct HexagonalView: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let point1 = CGPoint(x: 0, y: 20)
            let point2 = CGPoint(x: 0, y: rect.height-20)
            let point3 = CGPoint(x: rect.width/2, y: rect.height)
            let point4 = CGPoint(x: rect.width, y: rect.height-20)
            let point5 = CGPoint(x: rect.width, y: 20)
            let point6 = CGPoint(x: rect.width/2, y: 0)
            
            
            path .move(to: point6)
            
            path.addArc(tangent1End: point1, tangent2End: point2, radius: 15)
            path.addArc(tangent1End: point2, tangent2End: point3, radius: 15)
            path.addArc(tangent1End: point3, tangent2End: point4, radius: 15)
            path.addArc(tangent1End: point4, tangent2End: point5, radius: 15)
            path.addArc(tangent1End: point5, tangent2End: point6, radius: 15)
            
            
        }
    }
}

struct HexagonalView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonalView()
            .frame(width: 100,height: 120,alignment: .center)
    }
}
