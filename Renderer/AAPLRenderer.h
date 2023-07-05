//
//  Renderer.h
//  MetalRenderingEngine Shared
//
//  Created by Tushar Sankhala on 06/01/23.
//

#import <MetalKit/MetalKit.h>

// Our platform independent renderer class.   Implements the MTKViewDelegate protocol which
// allows it to accept per-frame update and drawable resize callbacks.
@interface AAPLRenderer : NSObject <MTKViewDelegate>

-(nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;

@end

