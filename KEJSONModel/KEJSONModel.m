//
//  KEJSONModel.m
//  KEJSONModel
//
//  Created by Kelvin Chan on 7/4/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "KEJSONModel.h"
#import <objc/message.h>

@implementation KEJSONModel

-(id) initWithDictionary:(NSMutableDictionary *)jsonObject {  // Designated
    if ((self = [super init])) {
        [self setValuesForKeysWithDictionary:jsonObject];
    }
    return self;
}


-(BOOL) allowsKeyedCoding {
    return YES;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    // do nothing.
}

-(id)mutableCopyWithZone:(NSZone *)zone {
    // Sub class implementation shoudl do a deep mutable copy
    // this class doesn't have any ivars so this is ok
    KEJSONModel *newModel = [[KEJSONModel allocWithZone:zone] init];
    return newModel;
}

-(id)copyWithZone:(NSZone *)zone {
    // Sub class implementation should do a deep copy
    KEJSONModel *newModel = [[KEJSONModel allocWithZone:zone] init];
    return newModel;
}

# pragma mark - KVC
-(void)setValue:(id)value forKey:(NSString *)key {
    
    // If key contains "-", convert to lower case start and the rest camel case
    // eg. convert row-count to rowCount
    key = [KEJSONModel dashDelimitedStringToUncapitalizedCamelCaseString:key];
    key = [KEJSONModel underscoreDelimitedStringToUncapitalizedCamelCaseString:key];
    
    // perform type/class checking
    // Introspect on the key/property's class type
    objc_property_t property = class_getProperty([self class], [key UTF8String]);
    if (property != nil) {
        
        NSString *propertyType = [[self class] propertyTypeStringOfProperty:property];
        
        if ([propertyType isEqualToString:@"NSMutableArray"]) {
            
            // Figure out what class/type the element of this array is:
            // Convention: just remove the 's' at the end of the name and capitalize
            NSString *elemClassName = [KEJSONModel capitalizeFirstChar:[KEJSONModel removeSuffixS:key]];
            
            Class elemClass = NSClassFromString(elemClassName);
            // TODO: Handle elemClass == nil, class has not been defined.
            NSMutableArray *arr = [@[] mutableCopy];
            for (id elem in value) {
                if ([elem isKindOfClass:[NSMutableDictionary class]] ||
                    [elem isKindOfClass:[NSDictionary class]]) {
                    
                    id elemObj = [[elemClass alloc] initWithDictionary:elem];
                    [arr addObject:elemObj];
                }
                else {
                    // This would be a pretty complicated situation, just bail for now.
                    NSAssert(NO, @"TODO: Must handle array of array in the given JSON");
                    return;
                }
            }
            
            [super setValue:arr forKey:key];
            
            return;       // IMPORTANT: you don't want the usual another setValue:forKey: treatment
        }
        
    }
    
    [super setValue:value forKey:key];
}


-(id)valueForUndefinedKey:(NSString *)key {
    // subclass implementation shoudl provide the correct key value mappings for custom keys
    NSLog(@"Undefined Key: %@", key);
    return nil;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    // subclass implementation should set the correct key value mappings for custom keys
    NSLog(@"Undefined Key: %@", key);
    
}

#pragma mark - Helper
+ (NSString *)propertyTypeStringOfProperty:(objc_property_t) property {
    
    // TODO: Auto-doc this with Xcode 5
    // return the String representing the name of the property's type, eg. "NSMutableArray", "NSString", etc.
    
    const char *attr = property_getAttributes(property);
    NSString *const attributes = [NSString stringWithCString:attr encoding:NSUTF8StringEncoding];
    
    NSRange const typeRangeStart = [attributes rangeOfString:@"T@\""];  // start of type string
    if (typeRangeStart.location != NSNotFound) {
        NSString *const typeStringWithQuote = [attributes substringFromIndex:typeRangeStart.location + typeRangeStart.length];
        NSRange const typeRangeEnd = [typeStringWithQuote rangeOfString:@"\""]; // end of type string
        if (typeRangeEnd.location != NSNotFound) {
            NSString *const typeString = [typeStringWithQuote substringToIndex:typeRangeEnd.location];
            return typeString;
        }
    }
    return nil;
}

+(NSString *)removeSuffixArray:(NSString *)inputString {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"Array$" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSMutableString *str = [inputString mutableCopy];
    
    [regex replaceMatchesInString:str options:0 range:NSMakeRange(0, inputString.length) withTemplate:@""];
    
    return str;
}

+(NSString *)removeSuffixS:(NSString *)inputString {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"s$" options:0 error:&error];
    
    NSMutableString *str = [inputString mutableCopy];
    
    [regex replaceMatchesInString:str options:0 range:NSMakeRange(0, inputString.length) withTemplate:@""];
    
    return str;
}

+(NSString *)capitalizeFirstChar:(NSString *)inputString {
    return [inputString stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[inputString substringToIndex:1] uppercaseString]];
}

+(NSString *)dashDelimitedStringToUncapitalizedCamelCaseString:(NSString *)inputString {
    // eg. convert row-count to rowCount
    
    if ([inputString rangeOfString:@"-"].location == NSNotFound)
        return inputString;
    
    NSMutableString *returnString = [NSMutableString new];
    NSArray *a = [inputString componentsSeparatedByString:@"-"];
    
    // Do not capitalize the 1st one.
    [returnString appendString:a[0]];
    
    for (int i = 1; i < a.count; i++) {
        NSString *capSubstr = [a[i] capitalizedString];
        [returnString appendString:capSubstr];
    }
    return returnString;
}

+(NSString *)underscoreDelimitedStringToUncapitalizedCamelCaseString:(NSString *)inputString {
    // eg. convert row_count to rowCount
    
    if ([inputString rangeOfString:@"_"].location == NSNotFound)
        return inputString;
    
    NSMutableString *returnString = [NSMutableString new];
    NSArray *a = [inputString componentsSeparatedByString:@"_"];
    
    // Do not capitalize the 1st one.
    [returnString appendString:a[0]];
    
    for (int i = 1; i < a.count; i++) {
        NSString *capSubstr = [a[i] capitalizedString];
        [returnString appendString:capSubstr];
    }
    return returnString;
}

@end

