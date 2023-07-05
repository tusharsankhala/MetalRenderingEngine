//
//  AppDelegate.h
//  MetalRenderingEngine macOS
//
//  Created by Tushar Sankhala on 06/01/23.
//

#if defined(TARGET_IOS)
@import UIKit;
#define PlatformViewController UIViewController
#else
@import AppKit;
#define PlatformViewController NSViewController
#endif

@import MetalKit;

#import "AAPLRenderer.h"

@interface AAPLViewController : PlatformViewController

@end

