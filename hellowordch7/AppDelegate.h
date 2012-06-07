//
//  AppDelegate.h
//  hellowordch7
//
//  Created by Cassidy Pangell on 6/6/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
    
    UIView *cameraView;
}

@property (nonatomic, retain) UIWindow *window;

@end
