////
////  HomeView.swift
////  EniFood
////
////  Created by Oleg Podrez on 5.01.25.
////
//
//import SwiftUI
//
//struct HomeView: View {
//    @State var email = ""
//    @State var password = ""
//    @State var rememberCheckBox = false
//    @State var showSignUp = true
//    var body: some View {
//        ScrollView(.vertical,showsIndicators: false){
//            if showSignUp {
//                SingUp(
//                    email: $email,
//                    password: $password,
//                    rememberCheckBox: $rememberCheckBox,
//                    showSingIn: $showSignUp,
//                    action: {
//                    })
//                .transition(.asymmetric(insertion: .move(edge:.trailing),
//                                        removal: .move(edge:.leading))
//                )
//            } else {
//                SingIn(
//                    email: $email,
//                    password: $password,
//                    rememberCheckBox: $rememberCheckBox,
//                    showSignUp: $showSignUp,
//                    action: {})
//                .transition(.asymmetric(insertion: .move(edge: .leading),
//                                        removal: .move(edge: .trailing)))
//            }
//        }
//    }
//}
//#Preview {
//    HomeView()
//}
//
