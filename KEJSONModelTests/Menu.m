//
//  Root.m
//  LibJSONModel
//
//  Created by Kelvin Chan on 7/5/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "Menu.h"

@implementation Menu

-(NSString *) description {
    NSString *desc = [NSString stringWithFormat:@"%lu menuItems and status = %@", (unsigned long)self.menuItems.count, self.status];
    return desc;
}

@end
