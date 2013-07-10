//
//  Root.m
//  LibJSONModel
//
//  Created by Kelvin Chan on 7/5/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "Root.h"

@implementation Root

-(NSString *) description {
    NSString *desc = [NSString stringWithFormat:@"%d menuItems and status = %@", self.menuItems.count, self.status];
    return desc;
}

@end
