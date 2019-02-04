//
//  ViewController.swift
//  Grouped Messages
//
//  Created by Maxim Granchenko on 2/3/19.
//  Copyright © 2019 Maxim Granchenko. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

class ChatViewController: UITableViewController {
    
    fileprivate let cellId = "id"
    
    fileprivate let chatMessages = [
        [
            ChatMessage(text: "это достойный заработок для копирайтеров и возможность заказать текст у профессиональных авторов. Здесь вы можете реализовать свой творческий потенциал или приобрести уникальные статьи для нужд своего сайта.", isIncoming: true, date: Date()),
            ChatMessage(text: "ростота в работе. Мы приложили много усилий, чтобы работать на нашей бирже копирайтинга было максимально легко и удобно", isIncoming: true, date: Date()),
        ],
        [
            ChatMessage(text: "Рейтинг копирайтеров наглядно демонстрирует опыт и востребованность исполнителя на сервисе Text.ru и позволяет заказчику быстро выбрать исполнителя на свой заказ.", isIncoming: false, date: Date()),
            ChatMessage(text: "Гарантии и безопасность. Биржа копирайтинга Text.ru предоставляет гарантии как заказчикам, так и исполнителям. Заказчик получает качественный текст, а исполнитель — оплату за свою работу при условии отличного выполнения. Для разрешения конфликтных ситуаций предусмотрен Арбитраж.", isIncoming: false, date: Date())
        ],
        [
            ChatMessage(text: "Биржа копирайтинга Text.ru — это достойный заработок для копирайтеров и возможность заказать текст у профессиональных авторов. Здесь вы можете реализовать свой творческий потенциал или приобрести уникальные статьи для нужд своего сайта.", isIncoming: true, date: Date()),
            ChatMessage(text: "Сервис онлайн проверки текста на уникальность Text.ru покажет процент уникальности текста. Глубокая и качественная проверка найдет дубликаты и рерайт.", isIncoming: true, date: Date()),
            ChatMessage(text: "Бесплатное определение уникальности текстов. Эффективные алгоритмы позволили сделать проверку глубокой и точной. Автоматическая проверка орфографии подскажет, где были допущены ошибки.", isIncoming: false, date: Date()),
        ],
        [
            ChatMessage(text: "Расширенные возможности. При регистрации на сервисе у вас будут расширены ограничения проверки, предназначенные для гостей, и вы получите возможность проверять гораздо большее количество текстов с помощью нашего сервиса плагиат онлайн.", isIncoming: false, date: Date()),
            ChatMessage(text: "Процедура проверки на плагиат проста: всего несколько кликов — и вы узнаете процент уникальности текста. Если в сети есть дубликаты текстов, они обязательно найдутся. Вы также можете проверить текст на ошибки с помощью сервиса проверки орфографии.", isIncoming: true, date: Date()),
            ChatMessage(text: "Новый алгоритм проверки на плагиат", isIncoming: false, date: Date())
        ],
        [
            ChatMessage(text: "Расширенные возможности. При регистрации на сервисе у вас будут расширены ограничения проверки, предназначенные для гостей, и вы получите возможность проверять гораздо большее количество текстов с помощью нашего сервиса плагиат онлайн.", isIncoming: false, date: Date()),
            ChatMessage(text: "Процедура проверки на плагиат проста: всего несколько кликов — и вы узнаете процент уникальности текста. Если в сети есть дубликаты текстов, они обязательно найдутся. Вы также можете проверить текст на ошибки с помощью сервиса проверки орфографии.", isIncoming: true, date: Date()),
        ],
        [
            ChatMessage(text: "Новый алгоритм проверки на плагиат", isIncoming: false, date: Date())
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.85, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ChatMessageCell else { return UITableViewCell() }
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        
        return cell
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            textAlignment = .center
            textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            backgroundColor = #colorLiteral(red: 0.5373396873, green: 0.909049809, blue: 0.6027674675, alpha: 1)
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.boldSystemFont(ofSize: 14)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContent = super.intrinsicContentSize
            let height = originalContent.height + 10
            layer.cornerRadius = height/2
            layer.masksToBounds = true
            return CGSize(width: originalContent.width + 20, height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstMessage = chatMessages[section].first {
            let dateFormatte = DateFormatter()
            dateFormatte.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = dateFormatte.string(from: firstMessage.date)
            
            let label = DateHeaderLabel()
            label.text = dateString
            
            let containerView = UIView()
            containerView.addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

