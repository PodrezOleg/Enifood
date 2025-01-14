//
//  AddEniFoodView.swift
//  EniFood
//
//  Created by Oleg Podrez on 14.01.25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddEniFoodView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @FocusState var isActive
    @State private var name = ""
    @State private var category = ""
    @State private var ingredients = ""
    @State private var instructions = ""
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var imageData: Data? = nil
    
    var body: some View {
        addInfoEniFood(title: "Продукты", text: $name)
        
    }
        }
    

#Preview {
    AddEniFoodView()
}


struct addInfoEniFood: View {
    var title: String
    @Binding var text: String
    @FocusState var isActive
    var body: some View {
        ZStack(alignment: .leading) {
            TextField(title, text: $text)
                .padding(.leading, 10)
                .frame(maxWidth: .infinity)
                .frame(height: 50).focused($isActive)
                .background(.gray.opacity(0.3), in: .rect(cornerRadius: 16))
            Text(text).padding(.leading, 10)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .animation(.smooth, value: isActive)
                .foregroundStyle(isActive ? .white : .secondary)
                .onTapGesture {
                    isActive = true
                    
                
                }
        }
    }
}
