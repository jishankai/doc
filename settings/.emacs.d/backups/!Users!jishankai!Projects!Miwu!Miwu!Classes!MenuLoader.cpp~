//
//  LevelLoader.cpp
//  CocosDragon-x
//
//  Created by long on 2013-03-01.
//
//

#include "LevelLoader.h"

#include "RabitLoader.h"
#include "ZombieLoader.h"

USING_NS_CC;
USING_NS_CC_EXT;

CCNode* LevelLoader::load()
{
    cocos2d::extension::CCNodeLoaderLibrary * ccNodeLoaderLibrary = cocos2d::extension::CCNodeLoaderLibrary::newDefaultCCNodeLoaderLibrary();
    
    ccNodeLoaderLibrary->registerCCNodeLoader("Level", LevelLoader::loader());
    ccNodeLoaderLibrary->registerCCNodeLoader("Rabit", RabitLoader::loader());
    ccNodeLoaderLibrary->registerCCNodeLoader("Zombie", ZombieLoader::loader());
    
    
    /* Create an autorelease CCBReader. */
    cocos2d::extension::CCBReader * ccbReader = new cocos2d::extension::CCBReader(ccNodeLoaderLibrary);
    ccbReader->autorelease();
    
    /* Read a ccbi file. */
    cocos2d::CCNode * node = ccbReader->readNodeGraphFromFile("Level.ccbi");

    return node;
}