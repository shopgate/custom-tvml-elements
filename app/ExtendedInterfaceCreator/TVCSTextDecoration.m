//
//  TVCSSTextDecoration.m
//  SampleApp
//
//  Created by Alex Goergisn on 19.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCSTextDecoration.h"

@implementation TVCSTextDecoration

+ (NSString *)name
{
    return @"tvcs-text-decoration";
}

+ (NSArray *)allowedValues
{
    return @[@"line-through", @"underline"];
}

+ (TVViewElementStyleType)styleType
{
    return TVViewElementStyleTypeString;
}

+ (Class)viewClass
{
    return [UILabel class];
}

+ (void)applyStyle:(TVViewElementStyle *)style toView:(UIView *)view
{
    NSString *styleValue = [style valueForStyleProperty:[self name]];
    
    if(![view isKindOfClass:[self viewClass]] || !styleValue || ![[self allowedValues] containsObject:styleValue]) {
        return;
    }
    
    UILabel *label = (UILabel *)view;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:label.attributedText];
    NSRange stringRange = NSMakeRange(0, attributedString.length);
    
    if ([styleValue isEqualToString:@"line-through"]) {
        [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@1 range:stringRange];
    } else if ([styleValue isEqualToString:@"underline"]) {
        [attributedString addAttribute:NSUnderlineStyleAttributeName value:@1 range:stringRange];
    }
    
    label.attributedText = attributedString;
    
}

@end
