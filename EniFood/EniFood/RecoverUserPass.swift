//
//  RecoverUserPass.swift
//  EniFood
//
//  Created by Oleg Podrez on 5.01.25.
//

import SwiftUI

struct RecoverUserPass: View {
    @State var email: String = ""
    var body: some View {
        VStack(spacing: 28){
            VStack(spacing: 8){
                Text("Забыл имя пользователя или пароль?").font(.title.bold())
                Text("Вели свою почту, что бы сбросить пароль")
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundStyle(.secondary)
            }
            .multilineTextAlignment(.center)
            TextField("email", text: $email)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            SignButton(title: "Отправить", action: {})
            Spacer()
        }
        .padding()
        .padding(.top, 20)
    }
}

#Preview {
    RecoverUserPass()
}
