//
//  YYTestAutoTypeModel.m
//  model
//
//  Created by Jz D on 2021/3/10.
//

#import <UIKit/UIKit.h>


#import "YYTestAutoTypeModel.h"

@implementation YYTestAutoTypeModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"boolValue" : @"v",
              @"BOOLValue" : @"v",
              @"charValue" : @"v",
              @"unsignedCharValue" : @"v",
              @"shortValue" : @"v",
              @"unsignedShortValue" : @"v",
              @"intValue" : @"v",
              @"unsignedIntValue" : @"v",
              @"longValue" : @"v",
              @"unsignedLongValue" : @"v",
              @"longLongValue" : @"v",
              @"unsignedLongLongValue" : @"v",
              @"floatValue" : @"v",
              @"doubleValue" : @"v",
              @"longDoubleValue" : @"v",
              @"classValue" : @"v",
              @"selectorValue" : @"v",
              @"blockValue" : @"v",
              @"pointerValue" : @"v",
              @"structValue" : @"v",
              @"pointValue" : @"v",
              
              @"anyObject" : @"v",
              @"object" : @"v",
              @"number" : @"v",
              @"decimal" : @"v",
              @"string" : @"v",
              @"mString" : @"v",
              @"data" : @"v",
              @"mData" : @"v",
              @"date" : @"v",
              @"value" : @"v",
              @"url" : @"v",
              
              @"array" : @"v",
              @"mArray" : @"v",
              @"dict" : @"v",
              @"mDict" : @"v",
              @"set" : @"v",
              @"mSet" : @"v"
              };
}


@end


@implementation YYTestModelToJSONModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"intValue" : @"int",
             @"longValue" : @"long",             // mapped to same key
             @"unsignedLongLongValue" : @"long", // mapped to same key
             @"shortValue" : @"ext.short"        // mapped to key path
             };
}
@end



@implementation YYTestKeyPathModelToJSONModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"a" : @"ext.a",
             @"b" : @"ext.b",
             @"c" : @"ext.a",
             @"e" : @"d.e",
             @"g" : @"f.g.g"
             };
}
@end
