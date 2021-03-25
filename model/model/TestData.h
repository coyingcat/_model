//
//  TestData.h
//  model
//
//  Created by Jz D on 2021/3/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



// Model: (no need to do anything)
@interface Author : NSObject
@property NSString *name;
@property NSString *birthday;
@end

    
@interface Book : NSObject
@property NSString *name;
@property NSUInteger pages;
@property Author *reporter;

@end



@interface Character : NSObject
@property NSString *name;
@property NSString *birthday;
@end

    
@interface BookTwo : NSObject
@property NSString *name;
@property NSUInteger pages;
@property Author *reporter;

@end



NS_ASSUME_NONNULL_END
