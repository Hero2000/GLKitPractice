//
//  OpenglController.m
//  TestEveryProject
//
//  Created by shawnfeng on 16/7/22.
//  Copyright © 2016年 shawnfeng. All rights reserved.
//

//  教程
// https://site.douban.com/129642/widget/notes/5513129/note/197166612/


//  罗大柚OpenGL ES教程系列_LessonTwo（Part 1）_使用VBO画一个立方体

// http://blog.csdn.net/casablaneca/article/details/20382433


#import "OpenglController.h"

#import <QuartzCore/QuartzCore.h>


@interface OpenglController ()

@property (strong, nonatomic) EAGLContext *context;

@end

@implementation OpenglController{

    float _curRed;
    BOOL _increasing;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _increasing = YES;
    _curRed = 0.0;
    
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:self.context];
//    self.delegate = self;
    self.preferredFramesPerSecond = 60;
    GLKView *view = [[GLKView alloc] initWithFrame:[[UIScreen mainScreen] bounds] context:self.context];
    view.delegate = self;
    view.tag = 1234;
    self.view = view;
    
    
//    view.enableSetNeedsDisplay = NO;
//    CADisplayLink* displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(render:)];
//    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode]; // 加入循环
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.paused = !self.paused;
}
- (void)render:(CADisplayLink*)displayLink {
    
    GLKView *view = (GLKView *)self.view;
    [view display]; // 间接调用drawInRect
    
}
- (void)update {
    NSLog(@"in glkViewControllerUpdate  %f",self.timeSinceLastUpdate);
    
    if (_increasing) {
        _curRed += 1.0*self.timeSinceLastUpdate;
    } else {
        _curRed -= 1.0*self.timeSinceLastUpdate;
    }
    if (_curRed >= 1.0) {
        _curRed = 1.0;
        _increasing = NO;
    }
    if (_curRed <= 0.0) {
        _curRed = 0.0;
        _increasing = YES;
    }
    
    
    glClearColor(_curRed, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}
//- (void)glkViewControllerUpdate:(GLKViewController *)controller {
//      NSLog(@"in glkViewControllerUpdate  %f",controller.timeSinceLastUpdate);
//    
//    if (_increasing) {
//        _curRed += 1.0*controller.timeSinceLastUpdate;
//    } else {
//        _curRed -= 1.0*controller.timeSinceLastUpdate;
//    }
//    if (_curRed >= 1.0) {
//        _curRed = 1.0;
//        _increasing = NO;
//    }
//    if (_curRed <= 0.0) {
//        _curRed = 0.0;
//        _increasing = YES;
//    }
//    
//    
//    glClearColor(_curRed, 0.0, 0.0, 1.0);
//    glClear(GL_COLOR_BUFFER_BIT);
//}
//
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    //  NSLog(@"in glkView:drawInRect:");
    
    
//    if (_increasing) {
//        _curRed += 0.01;
//    } else {
//        _curRed -= 0.01;
//    }
//    if (_curRed >= 1.0) {
//        _curRed = 1.0;
//        _increasing = NO;
//    }
//    if (_curRed <= 0.0) {
//        _curRed = 0.0;
//        _increasing = YES;
//    }
//
//    
//     glClearColor(_curRed, 0.0, 0.0, 1.0);
//    glClear(GL_COLOR_BUFFER_BIT);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    if ([EAGLContext currentContext] == self.context) {
        [EAGLContext setCurrentContext:nil];
    }
    self.context = nil;
}

@end
