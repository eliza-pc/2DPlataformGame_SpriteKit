//
//  PlayerCrontrolComponent.swift
//  2DPlataformGame_SpriteKit
//
//  Created by Eliza Maria Porto de Carvalho on 25/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayerControlComponet: GKComponent, ControlInputDelegate{
    
    var touchControlNode: TouchControlInputNode?
    
    func setupControls (camera: SKCameraNode, scen: SKScene){
        
        touchControlNode = TouchControlInputNode(frame: scen.frame)
        touchControlNode?.inputDelegate = self
        touchControlNode?.position = CGPoint.zero
        
        camera.addChild(touchControlNode!)
    }
   
    func follow(comand: String?) {
        print("command: \(String(describing: comand))")
    }
    
    
    
}
