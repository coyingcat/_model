//
//  TestData.m
//  model
//
//  Created by Jz D on 2021/3/10.
//

#import "TestData.h"



@implementation Author


@end


@implementation Book


+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"pages" : @"p",
             @"reporter" : @[@"author",@"writer"]};
}



@end
