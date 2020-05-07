//
//  ChatApiHelper.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/30/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//
 
import Foundation



//struct FetchChatData {
//
//
//
//   func fetchChatData(completion: @escaping (Result<[ChatContentText],chatDataError>) ->Void ) {
//              let dataTask = URLSession.shared.dataTask(with: ChatDataApi!) {Data,_,_ in
//                  guard let ChatApiResponse = Data else {
//                      completion(.failure(.noData))
//                      return
//                  }
//
//                  do {
//                      let chatparser = JSONDecoder ()
//                      let parseChat = try chatparser.decode(ChatData.self, from:  ChatApiResponse)
//                      let parsedChat = parseChat.data
//                      completion(.success(parsedChat))
//                      print (parsedChat)
//                  }catch{
//                      completion(.failure(.badData))
//                  }
//              }
//              dataTask.resume()
//          }
//
//
//
//
//
//
//}


