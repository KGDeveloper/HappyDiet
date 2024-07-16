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
        if (shareInfo.rootType == .unLogic) {
            Login(rootType: $shareInfo.rootType).frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
        } else if (shareInfo.rootType == .login) {
            TabController().frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
        } else {
            Welcome(rootType: $shareInfo.rootType)
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .background(LinearGradient(colors: [.white, .init(hex: 0xEEE6D9),.init(hex: 0xEEC8A4)], startPoint: .top, endPoint: .bottom))
        }
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let shareInfo = SharedInfo.shared
        let keyWindows = Windows().environmentObject(shareInfo)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UIHostingController(rootView: keyWindows)
        window?.makeKeyAndVisible()
    }
}
