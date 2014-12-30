//
//  ViewController.m
//  Dropit
//
//  Created by Julie Huguet on 27/12/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collision;

@end

@implementation ViewController

static const CGSize DROP_SIZE = {40,40};

- (UIDynamicAnimator *)animator
{
    if(!_animator)_animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.gameView];
    return _animator;
}

- (UIGravityBehavior *)gravity
{
    if(!_gravity){
        _gravity = [[UIGravityBehavior alloc]init];
        _gravity.magnitude = 0.9;
        [self.animator addBehavior:_gravity];
    }
    return _gravity;
}

- (UICollisionBehavior *)collision
{
    if(!_collision){
        _collision = [[UICollisionBehavior alloc]init];
        _collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:_collision];
    }
    return _collision;
}

- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    [self drop];
}

-(void)drop
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x = (arc4random()%(int)self.gameView.bounds.size.width) / DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    
    UIView *dropview = [[UIView alloc]initWithFrame:frame];
    dropview.backgroundColor = [self randomColor];
    [self.gameView addSubview:dropview];
    
    [self.gravity addItem:dropview];
    [self.collision addItem:dropview];
}

-(UIColor *)randomColor
{
    switch (arc4random()%5) {
        case 0: return [UIColor greenColor];
        case 1: return [UIColor blueColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
