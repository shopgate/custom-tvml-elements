//
//  TVCEImage.m
//  SampleApp
//
//  Created by Alex Goergisn on 24.12.15.
//  Copyright © 2015 Goergisn. All rights reserved.
//

#import "TVCEImage.h"
#import "UIImage+animatedGIF.h"

@implementation TVCEImage

#pragma mark - Privates

+ (Class)TVCE_existingViewClass
{
	return [UIImageView class];
}

#pragma mark TVCustomElementProtocol

+ (NSString*)name
{
    return @"tvce-image";
}

+ (Class)elementClass
{
    return [TVImageElement class];
}

+ (UIView*)viewForElement:(TVViewElement*)element existingView:(UIView*)existingView
{
	if ([element isKindOfClass:[self elementClass]] == NO || (existingView != nil && [existingView isKindOfClass:[self TVCE_existingViewClass]] == NO))
		return nil;
	
    TVImageElement* imageElement = (TVImageElement*)element;
    
    TVViewElementStyle* style = element.style;
    
    UIImageView* view = (UIImageView*)existingView;
    if (!view) {
        view = [UIImageView new];
        if (element.style.width && element.style.height) {
            view.frame = CGRectMake(0, 0, style.width, style.height);
        }
    }
    
    //Must not be an animated gif url
    view.image = [UIImage animatedImageWithAnimatedGIFURL:imageElement.URL];
    view.contentMode = UIViewContentModeScaleAspectFit;
    
    [TVCustomStylesController applyCustomStyle:style toView:view];
    
    if (style.backgroundColor.color) {
        view.backgroundColor = style.backgroundColor.color;
    }
    
    return view;
    
}


@end
