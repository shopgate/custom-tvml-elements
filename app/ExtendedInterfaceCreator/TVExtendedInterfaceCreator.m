//
//  CustomInterfaceCreator.m
//  Shopgate Standalone
//
//  Created by Alex Goergisn on 18.12.15.
//  Copyright © 2015 Shopgate. All rights reserved.
//

#import "TVExtendedInterfaceCreator.h"

#import "TVCustomElementsController.h"
#import "TVCustomStylesController.h"

@implementation TVExtendedInterfaceCreator

- (id)init
{
    self = [super init];
    if (self) {
        
        [TVCustomElementsController registerElements];
        [TVCustomStylesController registerStyles];
        
    }
    return self;
}

- (UIViewController *)viewControllerForElement:(TVViewElement *)element existingViewController:(UIViewController *)existingViewController
{
    //By returning nil we say that we do not handle the creation
    return nil;
}

- (UIView *)viewForElement:(TVViewElement *)element existingView:(UIView *)existingView
{
    return [TVCustomElementsController viewForElement:element existingView:existingView];
}

@end
