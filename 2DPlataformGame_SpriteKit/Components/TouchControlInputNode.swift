//
//  TouchControlInputNode.swift
//  2DPlataformGame_SpriteKit
//
//  Created by Eliza Maria Porto de Carvalho on 23/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit

class TouchControlInputNode: SKSpriteNode{
    
    var alphaUnpressed: CGFloat = 0.5
    var alphaPressed: CGFloat = 0.9
    
    var pressedButtons = [SKSpriteNode]()
    
    let buttonRight = SKSpriteNode(imageNamed: "right")
    let buttonLeft = SKSpriteNode(imageNamed: "left")
    
    let buttonJump = SKSpriteNode(imageNamed: "jump")
    
    init(frame: CGRect){
        super.init(texture: nil, color: UIColor.clear, size: frame.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpControls(size: CGSize){
        
        addButton(button: buttonRight, position: CGPoint(x: -(size.width / 3) + 50  , y: -(size.height)/4 ), name: "right", scale: 2.0)
        addButton(button: buttonLeft, position: CGPoint(x: -(size.width / 3) - 50  , y: -(size.height)/4 ), name: "left", scale: 2.0)
        
        addButton(button: buttonJump, position: CGPoint(x: -(size.width / 3) + 50  , y: -(size.height)/4 ), name: "jump", scale: 0.40)
    
    }
    
    func addButton(button: SKSpriteNode, position: CGPoint, name: String, scale: CGFloat){
        button.position = position
        button.setScale(scale)
        button.name = name
        button.zPosition = 10
        button.alpha = alphaPressed
        self.addChild(button)
        
    }
    
}
