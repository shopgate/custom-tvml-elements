# Custom TVML Elements & Styles
A Sample Project how to add custom TVML Elements and Styles to your TVML/TVJS Project using TVElementFactory, TVStyleFactory and the TVInterfaceCreating Protocol

# The Story behind
A [blog post](https://medium.com/shopgate-mobile-commerce/hacking-tvml-4387e65a9b94#.jwos3hwdi) about the motivation.

# How to run
1. Start the simple http-server by going into ./sample-template (Terminal) and use python -m SimpleHTTPServer 9001
2. Open the Xcode-Project in the ./app folder and run the App

# Sample App
The Sample App demonstrates how to use custom fonts + text-decoration and is easily extendable.
![Screenshot of SampleApp](https://github.com/goergisn/custom-tvml-elements/blob/develop/screenshot.png)

# How to use
The best way to understand how to use custom elements and styles is to have a look at the sample-template: https://github.com/goergisn/custom-tvml-elements/blob/master/sample-template/application.js

## Custom Elements

__tvce-attributedText__ (Allows the usage of __tvcs-text-decoration__ and __tvcs-font__ to have custom fonts and decorations)

__tvce-button__ (Allows (animated-)background images for different states + custom fonts/decorations)

__tvce-image__ (Allows animated Images)

## Custom Styles
__tvcs-text-decoration__ (Allows to add a line below or through the text)

- Allowed Values: 
   - _line-through_
   - _underline_
- Works with: 
   - _tvce-button_
   - _tvce-attributedText_

__tvcs-font__ (Allows usage of different fonts)

- Allowed Values: 
   - _All supported fonts on tvOS_ (http://ericasadun.com/2015/11/08/available-built-in-tvos-fonts/)
- Works with: 
   - _tvce-button_ 
   - _tvce-attributedText_

__tvcs-background-image__, __tvcs-background-image-highlighted__, __tvcs-background-image-focused__, __tvcs-background-image-disabled__, __tvcs-background-image-selected__ (Allows setting background images to buttons)

- Allowed Values: 
   - _Valid image URLs_ (including gif support)
- Works with:
   - _tvce-button_

__tvcs-content-mode__

- Allowed Values: 
   - _fit_ (Scales the content/image to fit inside the size of the element)
   - _fill_ (Scales the content/image to fill the element. Some parts of the content may be clipped)
   - defaults to stretching the image to fill
 - Works with: 
   - _tvce-image_
   - _tvce-button_
