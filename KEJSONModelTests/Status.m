//
//  Status.m
//  KEJSONModel
//
//  Created by Kelvin Chan on 7/22/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "Status.h"

@implementation Status

-(NSString *)description {
    return [NSString stringWithFormat:@"%@: %@", self.code, self.localdesc];
}

// Note: To simplify things, no need to do NSCoding for this. Implement this if you need it.
@end
