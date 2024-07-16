//
//  Welcome.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import SwiftUI

struct Welcome: View {
    
    @Binding var rootType: RootType
    
    @State private var paddingTop = -125.0
    @State private var paddingBottom = -23.0
    
    private var driveAnimation: Animation {.easeInOut(duration: 3).speed(3.5)}
    
    var body: some View {
        VStack {
            Image("appIcon")
                .frame(width: 125,height: 125)
                .padding(EdgeInsets(top: paddingTop, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            withAnimation {
                Image("nameIcon")
                    .frame(height: 23)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: paddingBottom, trailing: 0))
            }
        }.onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { (timer) in
                if (paddingTop < 200) {
                    paddingTop += 1
                } else {
                    checkIsLogin()
                    timer.invalidate()
                }
                
                if (paddingBottom < 108)  {
                    paddingBottom += 1
                }
            }
        }
    }
    
    func checkIsLogin() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            timer.invalidate()
            rootType = SharedInfo.shared.userInfo == nil ? .unLogic : .login
        }
    }
}
