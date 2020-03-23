//
//  ContentView.swift
//  BuildAnAppWithSwiftUI
//
//  Created by Howard Ge on 2020/3/17.
//  Copyright © 2020 Howard. All rights reserved.
//

import SwiftUI
/**
 Section 03 : Components and Visual Effects - 组件和视觉效果
 */

struct ContentView: View {
    var body: some View {
        ZStack {                    // 注意栈中各个组件的顺序和实际显示的层级关系
            TitleView()             // 标题视图
                .blur(radius: 20)   // 模糊（虚化）
            BackCardView()          // 最下面一层
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: -40)
                .scaleEffect(0.9)               // 缩放效果
                .rotationEffect(.degrees(10))   // 旋转
                .rotation3DEffect(.degrees(10), axis: (x: 10, y: 0, z: 0))      // 三维旋转
                .blendMode(.hardLight)      // 混合模式，高光
            BackCardView()          // 中间一层
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: -20)
                .scaleEffect(0.95)
                .rotationEffect(Angle.degrees(5))
                .rotation3DEffect(.degrees(5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
            CardView()              // 最上面一层
                .blendMode(.hardLight)
            BottomCardView()
                .blur(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI 设计")               // 文本框，相当于 label
                        .font(.title)               // 字体
                        .fontWeight(.semibold)      // 字体粗细
                        .foregroundColor(.white)    // 前景色
                    Text("证书")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")      // 图片
            }
                .padding(.horizontal, 20)       // 水平内边距
                .padding(.top, 20)              // 顶部内边距
            Spacer()
            Image("Card1")
                .resizable()                // 图片可改变大小，由此开始下面的各种调整
                .aspectRatio(contentMode: .fill)        // 纵横比
                .frame(width: 300, height: 110, alignment: .top)    // 定义尺寸和对齐
        }
        .frame(width: 340.0, height: 220.0)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()    //栈的占位符
        }
            .frame(width: 340.0, height: 220.0)     // 框体尺寸
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("证书册")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()                             // 视图上方的条状按钮
                .frame(width: 40, height: 6)
                .cornerRadius(3)
                .opacity(0.1)                       // 透明度
            Text("Howard Ge 已经通过本机构《UI设计》课程学习并通过考核，特此证明。")
                .multilineTextAlignment(.center)    // 多行文本对齐
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)             // 撑满
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .offset(x: 0, y: 500)
    }
}