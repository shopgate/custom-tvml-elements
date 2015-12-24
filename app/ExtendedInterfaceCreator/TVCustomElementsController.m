//
//  ElementLoader.m
//  SampleApp
//
//  Created by Alex Goergisn on 23.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCustomElementsController.h"

@interface TVCustomElementsController()

@property (strong, nonatomic) NSArray *customElements;

@end

@implementation TVCustomElementsController

+ (instancetype)sharedInstance
{
    static TVCustomElementsController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TVCustomElementsController new];
        [sharedInstance defineElements];
    });
    return sharedInstance;
}

- (void)defineElements
{
    self.customElements = @[[TVCEAttributedText class], [TVCEImage class]];
}

+ (void)registerElements
{
    for (Class <TVCustomElementProtocol>elementDefinition in [TVCustomElementsController sharedInstance].customElements) {
        [TVElementFactory registerViewElementClass:[elementDefinition elementClass] forElementName:[elementDefinition name]];
    }
}

+ (UIView *)viewForElement:(TVViewElement *)element existingView:(UIView *)existingView
{
        
    for (Class <TVCustomElementProtocol>elementDefinition in [TVCustomElementsController sharedInstance].customElements) {
        if ([[elementDefinition name] isEqualToString:element.elementName]) {
            return [elementDefinition viewForElement:element existingView:existingView];
        }
    }

    return nil;
}

@end
