////
////  PassCheckField.swift
////  EniFood
////
////  Created by Oleg Podrez on 5.01.25.
////
//
//import SwiftUI
//
//struct PassCheckField: View {
//    @State var text: String = ""
//    @FocusState var isActive
//    @State var checkMinCharacters: Bool = false
//    @State var checkLetters: Bool = false
//    @State var checkNumbers: Bool = false
//    @State var checkSpecialSymbols: Bool = false
//    @State var showPassCheck: Bool = false
//    
//    var progressColor: Color {
//        let containsLetters = text.rangeOfCharacter(from: .letters) != nil
//        let containsNumbers = text.rangeOfCharacter(from: .decimalDigits) != nil
//        let containsSpecialSymbols = text.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*")) != nil
//        
//        if containsLetters && containsNumbers && text.count >= 8  {
//            return Color.green
//        } else if containsLetters && !containsNumbers && !containsSpecialSymbols {
//            return Color.red
//        } else if containsNumbers && !containsLetters && !containsSpecialSymbols {
//            return Color.red
//        } else if containsLetters && containsNumbers && !containsSpecialSymbols {
//            return Color.yellow
//        } else if containsLetters && containsNumbers && containsSpecialSymbols {
//            return Color.blue
//        }
//        else {
//            return Color.gray
//        }
//    }
//    var body : some View {
//        VStack(alignment: .leading, spacing: 24){
//            ZStack(alignment: .leading){
//                ZStack {
//                    SecureField("", text: $text)
//                        .padding(.leading)
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 55).focused($isActive)
//                        .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
//                        .opacity((showPassCheck ? 0 : 1))
//                    TextField("", text: $text)
//                        .padding(.leading)
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 55).focused($isActive)
//                        .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
//                        .opacity((showPassCheck ? 1 : 0))
//                }
//                Text("Пароль").padding(.horizontal)
//                    .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
//                    .foregroundStyle(isActive ? .primary : .secondary)
//                    .animation(.spring, value: isActive)
//                    .onTapGesture {
//                        isActive = true
//                    }
//                    .onChange(of: text, { oldValue, newValue in
//                        withAnimation{
//                            checkMinCharacters = newValue.count >= 8
//                            checkLetters = newValue.rangeOfCharacter(from: CharacterSet.letters) != nil
//                            checkNumbers = newValue.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
//                            checkSpecialSymbols = newValue
//                                .rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*")) != nil
//                        }
//                    })
//            }
//            .overlay(alignment:.trailing) {
//                Image(systemName: showPassCheck ? "eye.slash" : "eye")
//                    .foregroundStyle(showPassCheck ? .primary : .secondary)
//                    .padding(16)
//                    .contentShape(Rectangle())
//                    .onTapGesture {showPassCheck.toggle()}
//            }
//        }
//        VStack(alignment: .leading, spacing: 10) {
//            CheckText(text: "Минимум 8 символов", check: $checkMinCharacters)
//            CheckText(text: "Не менее одной буквы", check: $checkLetters)
//            CheckText(text: "!@#$%^&*", check: $checkSpecialSymbols)
//            CheckText(text: "Цифры", check: $checkNumbers)
//        }
//    }
//    
//    struct CheckText: View {
//        let text: String
//        @Binding var check: Bool
//        var body: some View {
//            HStack{
//                Image(systemName: check ? "Checkmark.circle.fill" : "circle")
//                    .contentTransition(.symbolEffect)
//                Text(text)
//            }
//            .foregroundColor(check ? .white : .secondary)
//        }
//    }
//    
//    
//}
