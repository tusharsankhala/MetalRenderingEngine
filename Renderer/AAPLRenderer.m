//
//  Renderer.m
//  MetalRenderingEngine Shared
//
//  Created by Tushar Sankhala on 06/01/23.
//

@import simd;
@import MetalKit;

#import "AAPLRenderer.h"

// Main class performing the rendering
@implementation AAPLRenderer
{
    id <MTLDevice> _device;
    
    // The command queue used to pass commands to the device.
    id <MTLCommandQueue> _commandQueue;
}

-(nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;
{
    self = [super init];
    if(self)
    {
        _device = mtkView.device;
        
        // Create the command Queue.
        _commandQueue = [_device newCommandQueue];
    }

    return self;
}

- (void)drawInMTKView:(nonnull MTKView *)view
{
    /// Delay getting the currentRenderPassDescriptor until absolutely needed. This avoids
    /// holding onto the drawable and blocking the display pipeline any longer than necessary
    MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;

    if(renderPassDescriptor == nil)
    {
        return;
    }
    
    id <MTLCommandBuffer> commandBuffer = [_commandQueue commandBuffer];
    
    // Create a render pass and immediately end encoding, causing the drawable to be cleared
    id <MTLRenderCommandEncoder> commandEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        
    [commandEncoder endEncoding];

    // Get the drawable that will be presented at the end of the frame
    id<MTLDrawable> drawable = view.currentDrawable;
    
    // Request that the drawable texture be presented by the windowing system once drawing is done
    [commandBuffer presentDrawable:drawable];

    [commandBuffer commit];
}

- (void)mtkView:(nonnull MTKView *)view drawableSizeWillChange:(CGSize)size
{
    /// Respond to drawable size or orientation changes here
}

@end
