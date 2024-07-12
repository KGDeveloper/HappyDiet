//
//  Windows.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import SwiftUI

struct Windows: View {
    
    @EnvironmentObject var shareInfo: SharedInfo
    
    var body: some View {
        NavigationLink {
            switch shareInfo.type {
            case 0:
                Welcome()
                    .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                    .background(LinearGradient(colors: [.red,.blue], startPoint: .top, endPoint: .bottom))
            case 1:
                TabController()
                    .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                    .background(LinearGradient(colors: [.red,.blue], startPoint: .top, endPoint: .bottom))
            case 2:
                Login()
                    .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                    .background(LinearGradient(colors: [.red,.blue], startPoint: .top, endPoint: .bottom))
            default:
                Welcome()
                    .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                    .background(LinearGradient(colors: [.red,.blue], startPoint: .top, endPoint: .bottom))
            }
        } label: {
            Welcome()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .background(LinearGradient(colors: [.red,.blue], startPoint: .top, endPoint: .bottom))
        }
        
        Text("\(shareInfo.type)")
    }
}
