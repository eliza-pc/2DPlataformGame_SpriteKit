//
//  TouchControlInputNode.swift
//  2DPlataformGame_SpriteKit
//
//  Created by Eliza Maria Porto de Carvalho on 23/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit

class TouchControlInputNode: SKSpriteNode{
    
    
    //#MARK: Variables
    var alphaUnpressed: CGFloat = 0.5
    var alphaPressed: CGFloat = 0.9
    
    var pressedButtons = [SKSpriteNode]()
    
    let buttonRight = SKSpriteNode(imageNamed: "right")
    let buttonLeft = SKSpriteNode(imageNamed: "left")
    
    let buttonJump = SKSpriteNode(imageNamed: "jump")
    
    var inputDelegate: ControlInputDelegate?
    
    //#MARK: init
    init(frame: CGRect){
        super.init(texture: nil, color: UIColor.clear, size: frame.size)
        
        setUpControls(size: frame.size)
        isUserInteractionEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //#MARK: Functions
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            
            let location = t.location(in: parent!)
            
            for button in [buttonRight,buttonLeft,buttonJump]{
                if button.contains(location) && pressedButtons.firstIndex(of: button) == nil {
                    pressedButtons.append(button)
                    
                    if(inputDelegate != nil){
                        inputDelegate?.follow(comand: button.name)
                    }
                }
                
                if(pressedButtons.firstIndex(of: button) != nil){
                    button.alpha = alphaPressed
                }else{
                     button.alpha = alphaUnpressed
                }
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            
            let location = t.location(in: parent!)
            let previousLocation = t.previousLocation(in: parent!)
            
            for button in [buttonRight, buttonLeft, buttonJump]{
                if button.contains(previousLocation) && !button.contains(location){
                    let index = pressedButtons.firstIndex(of: button)
                    
                    if index != nil{
                        pressedButtons.remove(at: index!)
                        if(inputDelegate != nil){
                            inputDelegate?.follow(comand: "cancel \(String(describing: button.name))")
                        }
                        
                    }
                }
                else if !button.contains(previousLocation) && button.contains(location) && pressedButtons.firstIndex(of: button) == nil{
                    
                    pressedButtons.append(button)
                    if (inputDelegate != nil){
                        inputDelegate?.follow(comand: button.name!)
                    }
                }
                
                if(pressedButtons.firstIndex(of: button) != nil){
                    button.alpha = alphaPressed
                } else {
                    button.alpha = alphaUnpressed
                }
            }
        }
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
    func touchUp(touches: Set<UITouch>?, withEvent event: UIEvent?){
        for touch in touches!{
            
            let location = touch.location(in: parent!)
            let previousLocation = touch.previousLocation(in: parent!)
            
            for button in [buttonRight,buttonLeft,buttonJump]{
                if button.contains(location) || button.contains(previousLocation){
                    let index = pressedButtons.firstIndex(of: button)
                    
                    if index != nil{
                        pressedButtons.remove(at: index!)
                        if inputDelegate != nil {
                            inputDelegate?.follow(comand: "stop \(button.name!)")
                        }
                    }
                }
                
                if(pressedButtons.firstIndex(of: button) != nil){
                    button.alpha = alphaPressed
                }else{
                    button.alpha = alphaUnpressed
                }
            }
        }
    }
}
