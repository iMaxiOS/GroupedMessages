//
//  ChatMessageCell.swift
//  Grouped Messages
//
//  Created by Maxim Granchenko on 2/3/19.
//  Copyright © 2019 Maxim Granchenko. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubbleBgView = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var tralingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBgView.backgroundColor = chatMessage.isIncoming ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
            messageLabel.textColor = chatMessage.isIncoming ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                tralingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                tralingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(bubbleBgView)
        bubbleBgView.layer.cornerRadius = 10
        bubbleBgView.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        bubbleBgView.addSubview(messageLabel)
        
        let contraintsView = [
            bubbleBgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            bubbleBgView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -16),
            bubbleBgView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            messageLabel.topAnchor.constraint(equalTo: bubbleBgView.topAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleBgView.leadingAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleBgView.bottomAnchor, constant: -10),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleBgView.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(contraintsView)
        
        leadingConstraint = bubbleBgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        leadingConstraint.isActive = false
        tralingConstraint = bubbleBgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        tralingConstraint.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
