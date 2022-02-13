//
//  CircleProgressBar.swift
//
//  Created by Yulia Novikova on 12/9/20.
//  Copyright © 2020 Yulia. All rights reserved.
//

import SwiftUI
import Combine

struct CircleProgressBar: View {
    
    @ObservedObject var progressModel: ProgressViewModel
        
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .stroke(lineWidth: progressModel.strokeWidth)
                    .opacity(0.3)
                    .foregroundColor(Color(progressModel.color))
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progressModel.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: progressModel.strokeWidth, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color(progressModel.color))
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                
                Image("drop")
                    .resizable()
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.3, alignment: .center)
                
            }
            .padding(5)
        }
    }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(progressModel: ProgressViewModel())
    }
}

