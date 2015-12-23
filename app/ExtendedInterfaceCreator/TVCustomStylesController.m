//
//  StyleLoader.m
//  SampleApp
//
//  Created by Alex Goergisn on 23.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCustomStylesController.h"

@interface TVCustomStylesController()

@property (strong, nonatomic) NSArray *customStyles;

@end

@implementation TVCustomStylesController

+ (instancetype)sharedInstance
{
    static TVCustomStylesController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TVCustomStylesController new];
        [sharedInstance defineStyles];
    });
    return sharedInstance;
}

- (void)defineStyles
{
    self.customStyles = @[[TVCSTextDecoration class],
                          [TVCSFont class]];
}

+ (void)registerStyles
{
    for (Class <TVCustomStyleProtocol>styleDefinition in [TVCustomStylesController sharedInstance].customStyles) {
        [TVStyleFactory registerStyle:[styleDefinition name] withType:[styleDefinition styleType] inherited:NO];
    }
}

+ (void)applyCustomStyle:(TVViewElementStyle *)style toView:(UIView *)view
{
    for (Class <TVCustomStyleProtocol>styleDefinition in [TVCustomStylesController sharedInstance].customStyles) {
        [styleDefinition applyStyle:style toView:view];
    }
}

@end
