//
//  ChatViewController.swift
//  rapptrlabs-Test
//
//  Created by karthik yalamanchili on 4/27/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit

enum chatDataError : Error{
    case noData
    case badData
}

var ChatDataApi = URL (string:"http://dev.rapptrlabs.com/Tests/scripts/chat_log.php")

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var chatTable: UITableView?
    
    var chatResponseList = [ChatContentText]() {
        didSet {
            DispatchQueue.main.async {
                self.chatTable?.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dataApi = ChatDataApi else {fatalError()}
        ChatDataApi = dataApi
        chatTable?.delegate = self
        chatTable?.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
        self.configureTable(tableView: chatTable!)
        self.fetchChatData{[weak self] result in
            switch  result{
            case .failure(let error):
                print(error)
            case .success(let response):
                self?.chatResponseList = response
            }
        }
        
    }
    
    func fetchChatData(completion: @escaping (Result<[ChatContentText],chatDataError>) ->Void ) {
        let dataTask = URLSession.shared.dataTask(with: URL (string:"http://dev.rapptrlabs.com/Tests/scripts/chat_log.php")!) {Data,_,_ in
            guard let ChatApiResponse = Data else {
                completion(.failure(.noData))
                return
            }
            print(Data!)
            do {
                let chatparser = JSONDecoder ()
                let parseChat = try chatparser.decode(ChatData.self, from:  ChatApiResponse)
                let parsedChat = parseChat.data
                completion(.success(parsedChat))
                print (parsedChat)
            }catch{
                completion(.failure(.badData))
            }
        }
        dataTask.resume()
        
    }
    
    private func configureTable(tableView: UITableView) {
        chatTable?.delegate = self
        chatTable?.dataSource = self
        chatTable?.tableFooterView = UIView(frame: .zero)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatResponseList.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = ChatTableViewCell ()
        let cellData  = chatResponseList[indexPath.row]
        cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell")! as! ChatTableViewCell
        cell.UserNameLabel.text = cellData.name
        cell.chatextlabel.text = cellData.message
        cell.UserImg.load(url: URL(string: cellData.avatar_url)!)
        cell.UserImg.drawRoundImage()
        
        
        
        return cell
    }
    
}





