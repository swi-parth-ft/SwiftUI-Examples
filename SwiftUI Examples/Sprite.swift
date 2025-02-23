//
//  Sprite.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-24.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else { return }
            let location = touch.location(in: self)
        let box = SKSpriteNode(color: .orange, size: CGSize(width: 50, height: 50))
        
            box.position = location
            box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
            addChild(box)
        }
}

struct Sprite: View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 300)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 400)
            .ignoresSafeArea()
    }
}

#Preview {
    Sprite()
}
