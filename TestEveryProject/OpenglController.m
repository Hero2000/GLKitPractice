//
//  OpenglController.m
//  TestEveryProject
//
//  Created by shawnfeng on 16/7/22.
//  Copyright © 2016年 shawnfeng. All rights reserved.
//

#import "OpenglController.h"

@implementation OpenglController

- (void)viewDidLoad {
    [super viewDidLoad];
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    self.delegate = self;
    GLKView *view = [[GLKView alloc] initWithFrame:[[UIScreen mainScreen] bounds] context:context];
    view.delegate = self;
    self.view = view;
    
}
- (void)glkViewControllerUpdate:(GLKViewController *)controller {
    //  NSLog(@"in glkViewControllerUpdate");
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    //  NSLog(@"in glkView:drawInRect:");
    glClearColor(0.5, 1, 1, 0.5);
    glClear(GL_COLOR_BUFFER_BIT);
}
@end
