//
//  HelloWorldLayer.m
//  hellowordch7
//
//  Created by Cassidy Pangell on 6/6/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:48];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        //add touches
        self.isTouchEnabled = YES;
        
        //Preload sound effect
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"explosion.caf"];
        
	}
	return self;
}

-(void) registerWithTouchDispatcher {
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    //Set location of touch
    CGPoint location = [self convertTouchToNodeSpace:touch];
    NSLog(@"Touch %@", NSStringFromCGPoint(location));
    
    CCParticleSystem* emitter = [CCParticleFireworks node];
    emitter.position = ccp(location.x, location.y);
    emitter.life = 3.0f;
    emitter.duration = 2.7f;
    emitter.lifeVar = 0.1f;
    emitter.totalParticles = 200;
    [self addChild:emitter z:20];
    
    //Play sound effect
    [[SimpleAudioEngine sharedEngine] playEffect:@"explosion.caf"];
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
