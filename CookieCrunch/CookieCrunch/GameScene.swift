//
//  GameScene.swift
//  CookieCrunch
//
//  Created by milch on 25.06.14.
//  Copyright (c) 2014 Dennis Czombera inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var level: Level!
    var swipeFromColumn: Int?
    var swipeFromRow: Int?
    
    
    let tileWidth: CGFloat = 32.0
    let tileHeight: CGFloat = 36.0
    
    let gameLayer = SKNode()
    let tilesLayer = SKNode()
    let cookiesLayer = SKNode()
 
    init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "Background")
        addChild(background)
        addChild(gameLayer)
        
        let layerPosition = CGPoint(x: -tileWidth * CGFloat(NumColumns) / 2,
                                    y: -tileHeight * CGFloat(NumRows) / 2)
        tilesLayer.position = layerPosition
        cookiesLayer.position = layerPosition
        
        addChild(tilesLayer)
        addChild(cookiesLayer)
        
        swipeFromColumn = nil
        swipeFromRow = nil
    }
    
    func addSpritesForCookies(cookies: Set<Cookie>) {
        for cookie in cookies {
            let sprite = SKSpriteNode(imageNamed: cookie.cookieType.spriteName)
            sprite.position = pointForColumn(cookie.column, row: cookie.row)
            cookiesLayer.addChild(sprite)
            cookie.sprite = sprite
        }
    }
    
    func addTiles() {
        for row in 0..NumRows {
            for column in 0..NumColumns {
                if level.tileAtColumn(column, row: row) != nil {
                    let tileNode = SKSpriteNode(imageNamed: "Tile")
                    tileNode.position = pointForColumn(column, row: row)
                    tilesLayer.addChild(tileNode)
                }
            }
        }
    }
    
    func pointForColumn(column: Int, row: Int) -> CGPoint{
        return CGPoint(
                x: CGFloat(column) * tileWidth + tileWidth / 2,
                y: CGFloat(row) * tileHeight + tileHeight / 2)
    }
}
