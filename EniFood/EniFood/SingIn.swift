//
//  SingIn.swift
//  EniFood
//
//  Created by Oleg Podrez on 5.01.25.
//

import SwiftUI

struct SingIn: View {
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var rememberCheckBox: Bool
//    @Binding var showPassword: Bool
    @Binding var showSignUp: Bool
    @State var showForgotView: Bool = false
    var action: () -> Void
    var body: some View {
        VStack(spacing: 45) {
            TopView(title: "Добро Пожаловать в EniFood", details: "Зарешь свою кухню")
            InfoTF(title: "Email", text: $email)
            VStack(spacing: 24) {
                PasswordTextField(title: "Password", text: $password)
                HStack {
                    Toggle(isOn: $rememberCheckBox, label: {
                        Text("Label")
                    })
                    .toggleStyle((RememberCheckBoxStyle() ))
                    Spacer()
                    Button(action: {
                        showForgotView.toggle()
                    }, label:{
                        Text("Забыли где приправы(пароль)?").bold()
                            .font(.footnote)
                    })
                    .tint(.primary)
                }
            }
        }
        SignButton(title: "Войти", action: {})
        orView(title: "или")
        HStack(spacing: 65) {
            signAccount(image: .apple, width: 32, height: 32, action: {})
            signAccount(image: .email, width: 32, height: 32, action: {})
            signAccount(image: .google, width: 32, height: 32, action: {})
        }
        Spacer()
        Button {
            email = ""
            password = ""
            withAnimation {
                showSignUp.toggle()
            }
        } label: {
            Text("Еще нет своего повара?(аккаунта")
        }
        .tint(.primary)
        
        .padding()
        sheet(isPresented: $showForgotView, content: {
            RecoverUserPass()
                .presentationDetents([.fraction(0.40)])
        })
    }
}

#Preview {
    HomeView()
}
struct TopView: View {
    var title: String
    var details: String
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(title).font(.title.bold())
            Text(details).foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct InfoTF: View {
    var title: String
    @Binding var text: String
    @FocusState var isActive
    var body: some View {
        ZStack(alignment: .leading) {
            TextField(title, text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            Text(title).padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .animation(.spring, value: isActive)
                .foregroundStyle(isActive ? .white : .secondary)
                .onTapGesture {
                    isActive = true
                }
                
        }
    }
}

struct RememberCheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .contentTransition(.symbolEffect(.automatic))
                Text("Remember Me")
            }
        }
        .tint(.primary)
    }
}

struct SignButton: View {
    var title: String
    var action:() -> Void
    var body: some View {
        Button(action: {action()}, label:{
            Text(title).foregroundStyle(.primary).font(.title2.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.primary, in: .rect(cornerRadius: 16))
        })
        .tint(.primary)
    }
}

struct orView: View {
    var title: String
    var body: some View {
        HStack{
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
        }
    }
}

struct signAccount: View {
    var image: ImageResource
    var width: CGFloat
    var height: CGFloat
    var action:() -> Void
    var body: some View {
        Button(action: {}, label: { Image(image)
                .renderingMode(.template)
                .resizable().scaledToFit()
                .frame(width: 50, height: 50)
                .overlay {
                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1.5)
                        .foregroundStyle(.gray.opacity(0.3))
                }
        })
        .tint(.primary)
    }
}

enum ImageSource: String {
    case apple = "apple"
    case email = "email"
    case google = "google"
}
