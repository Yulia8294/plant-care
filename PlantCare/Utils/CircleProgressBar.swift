//
//  CircleProgressBar.swift
//
//  Created by Yulia Novikova on 12/9/20.
//  Copyright © 2020 Yulia. All rights reserved.
//

import SwiftUI

struct CircleProgressBar: View {
    
    @Binding var progress: Float
    
    @State var circleColor: Color = Color(UIColor.accent)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .stroke(lineWidth: 15)
                    .opacity(0.3)
                    .foregroundColor(circleColor)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(circleColor)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                
                Image("drop")
                    .resizable()
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3, alignment: .center)
                
            }
        }
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(progress: Binding.constant(0.3))
    }
}

