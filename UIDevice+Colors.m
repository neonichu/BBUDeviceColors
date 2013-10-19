//
//  UIDevice+Colors.m
//  DeviceColorsDemo
//
//  Created by Boris Bügling on 19.10.13.
//  Copyright (c) 2013 Boris Bügling. All rights reserved.
//

#import "UIDevice+Colors.h"

static NSString* const BBUDeviceInfoSelectorName    = @"X2RldmljZUluZm9Gb3JLZXk6";      // _deviceInfoForKey:
static NSString* const BBUEnclosureKey              = @"RGV2aWNlRW5jbG9zdXJlQ29sb3I=";  // DeviceEnclosureColor
static NSString* const BBUFrontColorKey             = @"RGV2aWNlQ29sb3I=";              // DeviceColor

static NSUInteger bbu_hexToDec(NSString* string) {
    unsigned int outVal;
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner scanHexInt:&outVal];
    return outVal;
}

@implementation UIDevice (Colors)

-(NSString*)bbu_decodeBase64String:(NSString*)string {
    return [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:string options:0] encoding:NSUTF8StringEncoding];
}

-(UIColor*)bbu_colorForKey:(NSString*)key {
    NSString* selectorName = [self bbu_decodeBase64String:BBUDeviceInfoSelectorName];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    NSString* deviceColorName = [self performSelector:NSSelectorFromString(selectorName) withObject:key];
#pragma clang diagnostic pop
    
    if ([deviceColorName hasPrefix:@"#"]) {
        return [UIColor colorWithRed:(bbu_hexToDec([deviceColorName substringWithRange:NSMakeRange(1, 2)]) / 255.0)
                               green:(bbu_hexToDec([deviceColorName substringWithRange:NSMakeRange(3, 2)]) / 255.0)
                                blue:(bbu_hexToDec([deviceColorName substringWithRange:NSMakeRange(5, 2)]) / 255.0)
                               alpha:1.0];
    } else {
        SEL colorSelector = NSSelectorFromString([deviceColorName stringByAppendingString:@"Color"]);
        
        if ([[UIColor class] respondsToSelector:colorSelector]) {
            return [UIColor performSelector:colorSelector];
        }
    }
    
    return nil;
}

-(UIColor*)bbu_enclosureColor {
    return [self bbu_colorForKey:[self bbu_decodeBase64String:BBUEnclosureKey]];
}

-(UIColor*)bbu_frontColor {
    return [self bbu_colorForKey:[self bbu_decodeBase64String:BBUFrontColorKey]];
}

@end
