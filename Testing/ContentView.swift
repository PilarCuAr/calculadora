//
//  ContentView.swift
//  Testing
//
//  Created by MAC on 02/09/22.
//

import SwiftUI
 
func sum(_ x: Int, _ y: Int) -> Int {
  x+y
}

struct Movie: Decodable {
 var name: String
 var releaseDate: Date
 
 enum CodingKeys: String, CodingKey {
   case movie = "movie_name"
 
   case releaseMonth = "release_month"
   case releaseDay = "release_day"
   case releaseYear = "release_year"
}
 
 init(from decoder: Decoder) throws {
   let values = try decoder.container(keyedBy: CodingKeys.self)
   name = try values.decode(String.self, forKey: .movie)
   let releaseMonth = try values.decode(String.self, forKey: .releaseMonth)
   let releaseDay = try values.decode(String.self, forKey: .releaseDay)
   let releaseYear = try values.decode(String.self, forKey: .releaseYear)
 
   let dateString = "\(releaseMonth)/\(releaseDay)/\(releaseYear)"
   let dateFormatter = DateFormatter()
   dateFormatter.dateFormat = "MM/dd/yy"
 
   releaseDate = dateFormatter.date(from: dateString) ?? Date()
 }
}
struct ContentView: View {
 
  @State private var number1: String = ""
  @State private var number2: String = ""
 
  var body: some View {
    VStack {
      Form {
        TextField("Number 1", text: $number1)
        TextField("Number 2", text: $number2)
 
        Text("Sum: \(sum((Int(number1) ?? 0), (Int(number2) ?? 0)))")
        Spacer()
      }
    }
  }
}
 
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
