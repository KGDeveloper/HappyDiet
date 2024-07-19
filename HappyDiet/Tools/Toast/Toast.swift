//
//  Toast.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/19.
//

import SwiftUI

/// 吐司类型
enum ToastType {
    case none
    case succ
    case fail
    case warn
    case loading
}

struct ToastMessage {
    var type: ToastType
    var message: String
    
    init(type: ToastType, message: String) {
        self.type = type
        self.message = message
    }
}

extension SharedInfo {
    
    func showToast(_ message: String, type: ToastType = .none) {
        _msgList.append(ToastMessage(type: type, message: message))
        if noticeInfo != nil {
            return
        }
        nextNotification()
    }
    
    func dismissToast() {
        noticeInfo = nil
    }
    
    func nextNotification() {
        if _msgList.isEmpty {
            return
        }
        noticeInfo = _msgList.first
        _msgList.removeFirst()
    }
}

struct Toast: View {
    
    @EnvironmentObject var shareInfo: SharedInfo
    @State var isAnimation: Bool = false
    
    var body: some View {
        
        if shareInfo.noticeInfo?.type == .loading {
            VStack {
                Image(systemName: "rays")
                    .font(.system(size: 48))
                    .foregroundStyle(.white)
                    .rotationEffect(isAnimation ? .degrees(180) : .degrees(0))
                Text(shareInfo.noticeInfo?.message ?? "")
                    .font(.system(size: 15))
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            }.padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(.black.opacity(0.5)).clipShape(.rect(cornerRadius: 10))
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .onDisappear {
                    shareInfo.nextNotification()
                }.onAppear {
                    rotate()
                }
        } else {
            HStack(alignment: .center) {
                Image(systemName: shareInfo.noticeInfo?.type == .warn ? "checkmark.circle.trianglebadge.exclamationmark" : shareInfo.noticeInfo?.type == .fail ? "checkmark.circle.badge.xmark" : "checkmark.circle.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(shareInfo.noticeInfo?.type == .warn ? .yellow : shareInfo.noticeInfo?.type == .fail ? .red : .green)
                Text(shareInfo.noticeInfo?.message ?? "")
                    .font(.system(size: 15))
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
            }
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(.black.opacity(0.5)).clipShape(.rect(cornerRadius: 10))
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .onAppear {
                _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (timer) in
                    timer.invalidate()
                    shareInfo.noticeInfo = nil
                })
            }.onDisappear {
                shareInfo.nextNotification()
            }
        }
    }
    
    func rotate() {
        withAnimation(.linear(duration: 1).repeatCount(1, autoreverses: false)) {
            isAnimation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isAnimation = false
            rotate()
        }
    }
}
