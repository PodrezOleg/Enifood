//
//  AddEniFoodRandomView.swift
//  EniFoodRandom
//
//  Created by Oleg Podrez on 14.01.25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddEniFoodRandomView: View {
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
        
        VStack (spacing: 10){
            addInfoEniFood(title: "Блюдо", text: $name)
            addInfoEniFood(title: "Категория", text: $category)
            addInfoEniFood(title: "Ингриденты", text: $ingredients)
            AddPhotoView(selectedImage: $selectedImage, imageData: $imageData)
            
                .navigationTitle("Добавить Блюдо")
                .foregroundStyle(.white)
                .padding()
            
        }
    }
  
        
        }


#Preview {
    AddEniFoodRandomView()
}


struct addInfoEniFood: View {
    var title: String
    @Binding var text: String
    @FocusState var isActive

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(isActive ? .green : .gray)

            TextField("", text: $text)
                .padding(10)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .focused($isActive)
                .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 16))
                .onTapGesture {
                    isActive = true
                }
        }
        .animation(.interactiveSpring, value: isActive)
    }
}


struct AddPhotoView: View {
    @Binding var selectedImage: PhotosPickerItem?
    @Binding var imageData: Data?
    
    var body : some View {
        VStack {
            PhotosPicker(selection: $selectedImage,
                         matching: .images,
                         photoLibrary: .shared()
            ) {
                Text("Выбрать фотографию")
                    .padding(10)
                    .foregroundStyle(.green)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(
                        Color.orange.opacity(0.3),
                        in: RoundedRectangle(
                            cornerRadius: 16,
                            style: .continuous))
            }
            .onChange(of: selectedImage) { oldValue, newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self) {
                        imageData = data
                    }
                }
            }
            if let imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerSize: .init(width: 16, height: 16)))
                    .padding()
            } else {
                Text("Фотография не выбрана")
                    .foregroundStyle(.gray)
            }
        }
    }
}
