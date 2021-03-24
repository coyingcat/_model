//
//  NSString+Log.m
//  model
//
//  Created by Jz D on 2021/3/24.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)


- (NSString *)debugDescription{
    NSError *error = nil;
    //字典转成json
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted  error:&error];
    //如果报错了就按原先的格式输出
    if (error) {
        return [super debugDescription];
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end

