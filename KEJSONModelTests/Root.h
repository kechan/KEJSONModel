//
//  Root.h
//  LibJSONModel
//
//  Created by Kelvin Chan on 7/5/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "KEJSONModel.h"
#import "MenuItem.h"

@interface Root : KEJSONModel

@property (nonatomic, strong) NSMutableArray *menuItems;
@property (nonatomic, strong) NSString *status;

@end
