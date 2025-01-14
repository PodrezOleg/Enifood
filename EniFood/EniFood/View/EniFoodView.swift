////
////  EniFoodView.swift
////  EniFood
////
////  Created by Oleg Podrez on 14.01.25.
////
//
//import SwiftUI
//import SwiftData
//
//struct EniFoodView: View {
//    @Environment(\.modelContext) private var ModelContext

//    var body: some View {
//        List{
//            ForEach(eniFoodList) { eniFood in
//                NavigationLink(destination: EniFoodDetailView(eniFood: eniFood)){
//                    VStack{
//                        Text(eniFood.name)
//                            .font(.headline)
//                        Text(eniFood.description)
//                            .font(.subheadline)
//                    }
//                }
//            }
//            .onDelete { indexSet in
//                for index in indexSet {
//                    ModelContext.delete(eniFoodList[index])
//                }
//            }
//        }
//        .navigationTitle("Cписок блюд")
//    }
//}
//
//#Preview {
//    EniFoodView()
//}
