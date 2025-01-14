////
////  PasswordTextField.swift
////  EniFood
////
////  Created by Oleg Podrez on 5.01.25.
////
//
//import SwiftUI
//
//struct PasswordTextField: View {
//    var title: String
//    @Binding var text: String
//    @FocusState var isActive
//    @State var showPassword: Bool = false
//    var body: some View {
//        ZStack(alignment: .leading){
//            SecureField("", text: $text)
//                .padding(.leading)
//                .frame(maxWidth: .infinity)
//                .frame(height: 55).focused($isActive)
//                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
//                .opacity(showPassword ? 0 : 1)
//            
//            TextField(title, text: $text)
//                .padding(.leading)
//                .frame(maxWidth: .infinity)
//                .frame(height: 55).focused($isActive)
//                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
//                .opacity(showPassword ? 1 : 0)
//            
//            Text(title).padding(.leading)
//                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
//                .animation(.spring, value: isActive)
//                .foregroundStyle(isActive ? .white : .secondary)
//                .onTapGesture {
//                    isActive = true
//                }
//        }
//            .overlay(alignment: .trailing) {
//                Image(systemName: showPassword ? "eye.slash" : "eye")
//                    .padding(16)
//                    .contentShape(Rectangle())
//                    .foregroundStyle(showPassword ? .primary : .secondary)
//                    .onTapGesture {apGesture in
//                        showPassword.toggle()
//                    }
//            }
//    }
//}
//
//#Preview {
//    
//    HomeView()
//}
