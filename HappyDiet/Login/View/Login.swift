//
//  Login.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/12.
//

import SwiftUI

struct Login: View {
    
    @Binding var rootType: RootType
    @StateObject private var viewModel: LoginViewModel = LoginViewModel()
    @EnvironmentObject var shareInfo: SharedInfo
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                /// 固定App名称
                Text(SharedInfo.shared.appInfo.appName)
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                    .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 0))
                    .frame(maxWidth: .infinity,minHeight: 240, maxHeight: 240,alignment: .leading)
                    .background(LinearGradient(colors: [.accentColor,.white], startPoint: .top, endPoint: .bottom))
                /// 用户手机号
                TextField(text: $viewModel.mobile) {
                    Text("手机号").foregroundStyle(Color.init(hex: 0xff989FA8)).font(.system(size: 14)).fontWeight(.medium)
                }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)).frame(height: 50)
                    .background(Color.init(hex: 0xffF1F2F6))
                    .clipShape(.rect(cornerRadius: 8),style: .init())
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                /// 用户密码
                TextField(text: $viewModel.visableCode) {
                    Text("验证码").foregroundStyle(Color.init(hex: 0xff989FA8)).font(.system(size: 14)).fontWeight(.medium)
                }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)).frame(height: 50)
                    .background(Color.init(hex: 0xffF1F2F6))
                    .clipShape(.rect(cornerRadius: 8),style: .init())
                    .padding(EdgeInsets(top: 15, leading: 30, bottom: 0, trailing: 30))

                Button(action: loginAction, label: {
                    Spacer()
                    Text("登 录")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 0))
                    Spacer()
                })
                .background(.accent)
                .clipShape(.rect(cornerRadius: 8),style: .init())
                .padding(EdgeInsets(top: 70, leading: 30, bottom: 0, trailing: 30))

                Spacer()

                HStack {
                    Button(action: viewModel.updateProtocolAgreeStatus) {
                        Image(systemName: viewModel.isAgree ? "circle.badge.checkmark.fill" : "circle.badge.checkmark")
                            .foregroundStyle(.accent)
                            .frame(width: 20,height: 20)
                    }

                    Text("请仔细阅读").font(.system(size: 14)).fontWeight(.medium).foregroundStyle(Color.init(hex: 0x989FA8))
                    Button(action: viewModel.gotoUserPage) {
                        Text("《用户协议》").font(.system(size: 14)).fontWeight(.medium).foregroundStyle(.accent)
                    }


                    Text("与").font(.system(size: 14)).fontWeight(.medium).foregroundStyle(Color.init(hex: 0x989FA8))
                    Button(action: viewModel.gotoPrivacyPage) {
                        Text("《隐私协议》").font(.system(size: 14)).fontWeight(.medium).foregroundStyle(.accent)
                    }
                }.padding(EdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30))
            }.navigationDestination(isPresented: $viewModel.isUserAgreement) {
                AgreementPage(isUserAgreement: viewModel.isUserAgreement)
            }.navigationDestination(isPresented: $viewModel.isPrivateAgreement) {
                AgreementPage(isUserAgreement: viewModel.isUserAgreement)
            }.navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.automatic)
        }
    }
}

extension Login {
    func loginAction() {
        if !viewModel.mobile.isValidChinesePhoneNumber {
            shareInfo.showToast("手机号不合法，请检查手机号", type: .warn)
        }
    }
}
