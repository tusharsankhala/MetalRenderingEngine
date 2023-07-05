//
//  main.m
//  MetalRenderingEngine iOS
//
//  Created by Tushar Sankhala on 06/01/23.
//

#if defined(TARGET_IOS)
#import <UIKit/UIKit.h>
#import "AAPLAppDelegate.h"
#else
#import <Cocoa/Cocoa.h>
#endif

#if defined(TARGET_IOS)
int main(int argc, char * argv[]) {
#if TARGET_OS_SIMULATOR && (!defined(__IPHONE_13_0) ||  !defined(__TVOS_13_0))
#error No simulator support for Metal API for this SDK version.  Must build for a device
#endif

    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AAPLAppDelegate class]));
    }
}

#elif defined(TARGET_MACOS)

int main(int argc, const char * argv[]) {
    return NSApplicationMain(argc, argv);
}

#endif
