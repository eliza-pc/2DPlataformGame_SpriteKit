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
    
    
}
