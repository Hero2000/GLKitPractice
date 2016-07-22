//
//  OpenglTwoViewController.m
//  TestEveryProject
//
//  Created by shawnfeng on 16/7/22.
//  Copyright © 2016年 shawnfeng. All rights reserved.
//

/*
 罗大柚OpenGL ES教程系列
 http://blog.csdn.net/luozhonglan/article/category/1879283
 */

#import "OpenglTwoViewController.h"

@interface OpenglTwoViewController ()

@property (strong, nonatomic) EAGLContext *context;
@property (strong,nonatomic) GLKBaseEffect*baseEffect;

- (void)setupGL;

- (void)tearDownGL;

@end

@implementation OpenglTwoViewController{
    
    float _rotation;
    
    GLuint vertexBufferID;
    
    GLuint indexBufferID;
    
}

typedef struct {
    
    float Position[3];
    
}Vertex;

static const Vertex Vertices[] =

{
    
    {-1.0, 1, 0.0},
    
    {-1, -1, 0.0},
    
    {2,-1, 0.0},
    
    {1,1, 0.0},
    

    
    
};

const GLubyte Indices[]= {
    
    3,0,1,
    
    1,2,3,
    
 
    

    
};




//static const Vertex Vertices[] =
//
//{
//    
//    {-0.307768, -0.423607, 0.0},
//    
//    {-0.190211, -0.061803, 0.0},
//    
//    {-0.497980, 0.161803, 0.0},
//    
//    {-0.117557, 0.161803, 0.0},
//    
//    {0.0,       0.523607, 0.0},
//    
//    {0.117557,  0.161803, 0.0},
//    
//    {0.497980,  0.161803, 0.0},
//    
//    {0.190211, -0.061803, 0.0},
//    
//    {0.307768, -0.423607, 0.0},
//    
//    {0.0,      -0.2,      0.0}
//    
//};
//
//const GLubyte Indices[]= {
//    
//    9,0,1,
//    
//    1,2,3,
//    
//    3,4,5,
//    
//    5,6,7,
//    
//    7,8,9,
//    
//    9,1,5,
//    
//    5,7,9,
//    
//    1,3,5
//    
//};



//const Vertex Vertices[] = {
//    
//    {{ 0.5f, -0.5f,  0.0f}},
//    
//    {{ 0.5f, 0.5f,  0.0f}},
//    
//    {{-0.5f, 0.5f,  0.0f}},
//    
//    {{-0.5f, -0.5f,  0.0f}},
//    
//    {{ 0.5f, -0.5f, -0.5f}},
//    
//    {{ 0.5f, 0.5f, -0.5f}},
//    
//    {{-0.5f, 0.5f, -0.5f}},
//    
//    {{-0.5f, -0.5f, -0.5f}}
//    
//};

//const GLubyte Indices[] = {
//    
//    // Front
//    
//    0, 1, 2,
//    
//    2, 3, 0,
//    
//    // Back
//    
//    4, 6, 5,
//    
//    4, 7, 6,
//    
//    // Left
//    
//    2, 7, 3,
//    
//    7, 6, 2,
//    
//    // Right
//    
//    0, 4, 1,
//    
//    4, 1, 5,
//    
//    // Top
//    
//    6, 2, 1,
//    
//    1, 6, 5,
//    
//    // Bottom
//    
//    0, 3, 7,
//    
//    0, 7, 4
//    
//};


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.paused = !self.paused;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    //创建context
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    
    
    if (!self.context) {
        
        NSLog(@"Failed to create ES context");
        
    }
    
    
    
    //设定当前的View为GLKView
    
    GLKView *view = (GLKView *)self.view;
    
    
    //设定当前View对象的context为前面创建的context
    
    view.context = self.context;
    
    
    
    //设置深度buffer的格式
    
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    
    
    
    [self setupGL];
}
- (void)setupGL

{
    
    //设定当前的context
    
    [EAGLContext setCurrentContext:self.context];
    
    
    
    //创建baseEffect
    
    self.baseEffect = [[GLKBaseEffect alloc] init];
    
    self.baseEffect.useConstantColor =GL_TRUE;
    
    self.baseEffect.constantColor =GLKVector4Make(0.0f, 1.0f, 0.0f, 1.0f);
    
    
    
    //设置VBO
    
    glGenBuffers(1,               // STEP 1
                 
                 &vertexBufferID);
    
    glBindBuffer(GL_ARRAY_BUFFER, // STEP 2
                 
                 vertexBufferID);
    
    glBufferData(                 // STEP 3
                 
                 GL_ARRAY_BUFFER, //Initialize buffer contents
                 
                 sizeof(Vertices),//Number of bytes to copy
                 
                 Vertices,        // Address of bytes to copy
                 
                 GL_STATIC_DRAW); // Hint:cache in GPU memory
    
    
    
    
    
    //索引
    
    glGenBuffers(1, &indexBufferID);
    
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,indexBufferID);
    
    glBufferData(GL_ELEMENT_ARRAY_BUFFER,sizeof(Indices),Indices, GL_STATIC_DRAW);
    
}
- (void)tearDownGL

{
    
    [EAGLContext setCurrentContext:self.context];
    
    
    
    glDeleteBuffers(1, &vertexBufferID);
    
    glDeleteBuffers(1, &indexBufferID);
    
    
    
    
    
    self.baseEffect =nil;
    
    
    
}

- (void)update

{
    
    //投影变换
    
    float aspect= fabs(self.view.bounds.size.width /self.view.bounds.size.height);
    
    GLKMatrix4 projectionMatrix =GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0f), aspect, 0.1f, 100.0f);
    
    
    
    self.baseEffect.transform.projectionMatrix = projectionMatrix;
    
    
    
    //模型视图变换
    
    
    
    //平移变换
    
    GLKMatrix4 modelViewMatrix =GLKMatrix4MakeTranslation(0.0f, 0.0f, -5.5f);
    
    //旋转变换
    
    modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix,_rotation, 1.0f, 1.0f, 1.0f);
    
    self.baseEffect.transform.modelviewMatrix = modelViewMatrix;
    
    
    
    
    
//    _rotation += self.timeSinceLastUpdate * 0.5f;
    
    
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect

{
    
    glClearColor(0.65f, 0.65f, 0.65f, 1.0f);
    
    glClear(GL_COLOR_BUFFER_BIT |GL_DEPTH_BUFFER_BIT);
    
    //启动深度测试
    
    glEnable(GL_DEPTH_TEST);
    
    
    
    [self.baseEffect prepareToDraw];
    
    
    
    glBindBuffer(GL_ARRAY_BUFFER,vertexBufferID);
    
    
    
    glVertexAttribPointer(         // STEP 5
                          
                          GLKVertexAttribPosition,
                          
                          3,                   // three components per vertex
                          
                          GL_FLOAT,           // data is floating point
                          
                          GL_FALSE,           // no fixed point scaling
                          
                          sizeof(Vertex),                   // no gaps in data
                          
                          NULL);              // NULL tells GPU to start at
    
    glEnableVertexAttribArray(     // STEP 4
                              
                              GLKVertexAttribPosition);
    
    
    
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,indexBufferID);
    
    glDrawElements(GL_TRIANGLE_STRIP,sizeof(Indices)/sizeof(Indices[0]),
                   
                   GL_UNSIGNED_BYTE, (void *)0);
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
