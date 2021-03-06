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
@property Author *author;
@end



NS_ASSUME_NONNULL_END
