//
//  TVCSSFont.m
//  SampleApp
//
//  Created by Alex Goergisn on 19.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCSFont.h"

@implementation TVCSFont

+ (NSString *)name
{
    return @"tvcs-font";
}

+ (NSArray *)allowedValues
{
    return [UIFont familyNames];
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
    
    CGFloat fontSize = style.fontSize?style.fontSize:11;
    UIFont * font = [UIFont fontWithName:styleValue size:fontSize];
    [attributedString addAttribute:NSFontAttributeName value:font range:stringRange];
    
    label.attributedText = attributedString;
}

@end
