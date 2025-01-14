////
////  SingUp.swift
////  EniFood
////
////  Created by Oleg Podrez on 5.01.25.
////
//
//import SwiftUI
//
//struct SingUp: View {
//    @FocusState var isActive
//    @Binding var email: String
//    @Binding var password: String
//    @Binding var rememberCheckBox: Bool
//    @Binding var showSingIn: Bool
//    var action: () -> Void
//    var body: some View {
//        VStack(spacing: 45) {
//            TopView(title: "Добро Пожаловать в EniFood", details: "Зарешь свою кухню")
//            InfoTF(title: "Email", text: $email)
//            PassCheckField()
//        }
//        SignButton(title: "Войти", action: {})
//        orView(title: "или")
//        HStack(spacing: 65) {
//            signAccount(image: .apple, width: 32, height: 32, action: {})
//            signAccount(image: .email, width: 32, height: 32, action: {})
//            signAccount(image: .google, width: 32, height: 32, action: {})
//        }
//        Spacer()
//        Button {
//            email = ""
//            password = ""
//            withAnimation {
//                showSingIn.toggle()
//            }
//        } label: {
//                Text("Еще нет своего повара?(аккаунта")
//            }
//            .tint(.primary)
//        .padding()
//    }
//}
//
//#Preview {
//    HomeView()
//}
