//
//  GameScene.swift
//  2DPlataformGame_SpriteKit
//
//  Created by Eliza Maria Porto de Carvalho on 23/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
 
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
        
    }
    
    override func didMove(to view: SKView) {
        if let thePlayer = childNode(withName: "Player"){
            
            //pc = playerControlComponet
            if let pcComponent = thePlayer.entity?.component(ofType: PlayerControlComponet.self){
                
                pcComponent.setupControls(camera: camera!, scen: self)
                
            }
            
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}
