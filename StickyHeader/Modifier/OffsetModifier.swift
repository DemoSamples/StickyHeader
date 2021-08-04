//
//  OffsetModifier.swift
//  StickyHeader
//
//  Created by user on 04/08/2021.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content.overlay(
            GeometryReader { proxy -> Color in
                //--Getting minY from global coordinate
                //let minY = proxy.frame(in: .global).minY
                
                //--Getting value from coordinate space caled scroll
                let minY = proxy.frame(in: .named("SCROLL")).minY
                print(minY)
                DispatchQueue.main.async {
                    self.offset = minY
                }
                return Color.clear
            }
            , alignment: .top
        )
    }
}
