//
//  Status.h
//  KEJSONModel
//
//  Created by Kelvin Chan on 7/22/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "KEJSONModel.h"

@interface Status : KEJSONModel

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *localdesc;

@end
