//
//  Root.m
//  LibJSONModel
//
//  Created by Kelvin Chan on 7/5/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "Root.h"

@implementation Root

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    // No renaming between Json key and object property name required.
    [super setValue:value forUndefinedKey:key];
}

-(NSString *) description {
    return @"Json Root with menuItems and status";
}

#pragma mark - Keyed Archiving
-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.menuItems forKey:@"menuItems"];
    [aCoder encodeObject:self.status forKey:@"status"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.menuItems = [aDecoder decodeObjectForKey:@"menuItems"];
        self.status = [aDecoder decodeObjectForKey:@"status"];
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone {
    
    id theCopy = [[[self class] allocWithZone:zone] init]; // use designated initializer
    
    [theCopy setMenuItems:[self.menuItems copy]];
    [theCopy setStatus:[self.status copy]];
    
    return theCopy;
}

@end
