//
//  AttributedTextLabel.m
//  SampleApp
//
//  Created by Alex Goergisn on 19.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCEAttributedText.h"

@implementation TVCEAttributedText

+ (NSString *)name
{
    return @"tvce-attributedText";
}

+ (Class)elementClass
{
    return [TVTextElement class];
}

+ (Class)existingViewClass
{
    return [UILabel class];
}

+ (UIView *)viewForElement:(TVViewElement *)element existingView:(UIView *)existingView
{
    if (![element isKindOfClass:[self elementClass]] || (existingView && ![existingView isKindOfClass:[self existingViewClass]])) {
        return nil;
    }
    
    TVTextElement *textElement = (TVTextElement *)element;
    
    TVViewElementStyle *style = textElement.style;
    
    UILabel * attributedLabel = (UILabel *)existingView;
    if (!attributedLabel) {
        attributedLabel = [UILabel new];
        if (textElement.style.width && textElement.style.height) {
            attributedLabel.frame = CGRectMake(0, 0, style.width, style.height);
        }
    }
    
    attributedLabel.attributedText = textElement.attributedText;
    
    [TVCustomStylesController applyCustomStyle:style toView:attributedLabel];
    
    if (style.backgroundColor.color) {
        attributedLabel.backgroundColor = style.backgroundColor.color;
    }
    
    return attributedLabel;

}

@end
