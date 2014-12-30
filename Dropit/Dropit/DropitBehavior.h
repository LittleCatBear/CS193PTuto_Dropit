//
//  DropitBehavior.h
//  Dropit
//
//  Created by Julie Huguet on 30/12/2014.
//  Copyright (c) 2014 Julie Huguet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id<UIDynamicItem>)item;

@end
