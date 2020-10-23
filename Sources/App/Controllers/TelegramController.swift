//
//  TelegramController.swift
//  App
//
//  Created by Xavier Pedrals Camprubí on 21/10/2020.
//

import Foundation
import TelegramBotSDK
import Vapor
import Jobs

class TelegramController {
    
    var bot: TelegramBot
    var myChat: ChatId
    
    init() {
        self.bot = TelegramBot(token: "1250243784:AAHbFtxsLVF2yk3OgubONjbR8NleXt_B75c")
        self.myChat = .chat(8930441) // your user id
    }
    
    func sayHello() {
        bot.sendMessageSync(chatId: myChat, text: "Hello master it's \(Date())")
    }
    
    func setupTimer() {
        Jobs.add(interval: .seconds(20)) {
            print("👋 I'm printed every 20 seconds!")
            self.sayHello()
        }
    }
    
    @objc func sida() {
        print("Sida called")
        sayHello()
        setupTimer()
    }
    
}
