//
//  KEJSONModel.h
//  KEJSONModel
//
//  Created by Kelvin Chan on 7/4/13.
//  Copyright (c) 2013 Kelvin Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KEJSONModel : NSObject


/*!
 *  @abstract Return the user supplied JSON key -> Property Name map.
 *
 *  @return NSDictionary whose keys are the JSON keys and values are the object property names
 * 
 *  @discussion
 *    Subclass can override this to provide a NSDictionary that map
 *    json key to the object property name. This is often the case for web service
 *    with key name that don't conform to Objective C NSObject property naming convention,
 *    which is usually camel case. This is highly recommended (maybe mandatory) if there's
 *    a conflict with NSObject's properties such as id, description, etc. Your subclass
 *    should have property names that avoid this conflict, and map it accordingly.
 *
 *    Example:
 *    +(NSDictionary *) jsonKeyToObjectPropertyNameMap {
 *        return @{@"id": @"myObjectId",
 *                 @"description": @"myObjectDescription",
 *                 @"Weird_looking--:field": @"weirdLookingField"}
 *     }
 *
 *     for a class like:
 *        @interface MyObject : KEJSONModel
 *        @property(nonatomic, strong) NSString *myObjectId;
 *        @property(nonatomic, strong) NSString *myObjectDescription;
 *        @property(nonatomic, strong) NSString *weirdLookingField;
 *
 *
 */
+(NSDictionary *)jsonKeyToObjectPropertyNameMap;

/*!
 *  @abstract Initializes the model with a NSDictionary representation of the JSON
 *
 *  @param jsonObject The NSDictionary representation of the JSON
 *  @discussion
 *	
 */
-(id)initWithDictionary:(NSMutableDictionary *)jsonObject;

/*!
 *  @abstract Convert the object back to its original NSDictionary representation
 *
 *  @param bSkipNull A boolean to indicate if null value entry should be skipped.
 *
 *  @return NSDictionary representation of object with its original keys.
 *
 *  @discussion
 *	The output is similar to the input NSDictionary used in -(id)initWithDictionary:(NSMutableDicionary *)jsonObject, but values will reflect any changes done to the object's properties. Note that the key will be the original JSON keys if the object has been initialized with -(id)initWithDictionary:jsonObject sourcing from JSON.
 *
 *
 */
-(NSDictionary *)toNSDictionarySkipNullValue:(BOOL)bSkipNull;


/*!
 *  @abstract Given an inputString, return the camel case version. This is done by applying simple string manipulation rules.
 *
 *  @param inputString This should be the JSON key.
 *
 *  @return Massaged camel-case string
 *
 *  @discussion
 *  This is useful if you want to re-contruct the mapping to and from between the json keys
 *  and object property names.
 *
 */
+(NSString *)massageInputStringToCamelCase:(NSString *) inputString;

@end
