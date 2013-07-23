//
//  MenuItem.h
//  LibJSONModel
//
//  Created by Kelvin Chan on 7/3/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import "KEJSONModel.h"

/*
 "id": "JAP122",
 "name": "Teriyaki Bento",
 "spicyLevel": 2,
 "description" : "Teriyaki Bento is one of the best lorem ipsum dolor sit",
 "reviewCount" : "4"
 */

@interface MenuItem : KEJSONModel <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *spicyLevel;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) NSString *reviewCount;

@property (nonatomic, strong) NSMutableArray *reviews;


@end
