//
//  ContentView.swift
//  ExtractTextFromPDF
//
//  Created by Angelos Staboulis on 25/12/23.
//

import SwiftUI
import PDFKit
struct ContentView: View {
    @State var pdfURL:String
    @State var textURL:String
    @State var presented:Bool
    var body: some View {
        VStack {
            VStack{
                Text("PDF URL").frame(width:350,height:15,alignment: .leading)
                TextField("",text: $pdfURL).onChange(of: pdfURL) { oldValue, newValue in
                    textURL = pdfURL.dropLast(3)+"doc"
                }.frame(width:350,height:15,alignment: .leading)
            }.padding(30)
            VStack{
                Text("TextFile URL").frame(width:350,height:15,alignment: .leading)
                TextField("",text:$textURL).disabled(true).frame(width:350,height:15,alignment: .leading)
                
            }.padding(30)
            Button(action: {
               createFile()
            }, label: {
                Text("Create Text File").frame(width:330,height:60)
            }).alert(isPresented: $presented, content: {
                let alert = Alert(title: Text("Information Message"),message:Text("File was created!!!"),dismissButton: .cancel())
                return alert
            }).frame(width:330 ,height:60)
        }
        
    }
    func createFile(){
        presented.toggle()
        let pdfDoc = PDFDocument(url: URL(filePath: pdfURL))
        FileManager.default.createFile(atPath: textURL, contents: pdfDoc!.string!.data(using: .utf8))
    }
}

#Preview {
    ContentView(pdfURL: "", textURL: "", presented: false)
}
