//
//  Home.swift
//  BuildAnAppWithSwiftUI
//
//  Created by Howard Ge on 2020/3/22.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false              // 声明控制动画的状态变量
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))                           // ZStack 最前面，即最底层
                .edgesIgnoringSafeArea(.all)    // 忽略安全区域，满屏
            
            VStack {                            // 主屏幕
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {self.showProfile.toggle()}) {   // 按钮单击响应，切换 showProfile 状态
                        Image("wowLM_small")
                            .renderingMode(.original)               // 修改渲染模式，保证图片正常显示
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                Spacer()
            }
                .padding(.top, 44)                      // 让出安全区域（这是 iPhone 11 Pro 的数据）
                .background(Color.white)                // 主屏幕的背景颜色
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? -10 : 0), axis: (x: 10, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)     // 使用 showProfile 控制缩放效果
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)            // 忽略安全区域，填满屏幕
            
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
