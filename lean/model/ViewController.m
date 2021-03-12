//
//  ViewController.m
//  model
//
//  Created by Jz D on 2021/3/10.
//

#import "ViewController.h"
#import "YYTestAutoTypeModel.h"
#import "YYModel.h"


#import "ForBlock.h"
#import "YYTestHelper.h"
#import "TestData.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // [self testBlock];
    // [self two];
    
    NSString * path = [NSBundle.mainBundle pathForResource: @"one" ofType: @"json"];
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
     
    Book * page = [Book yy_modelWithJSON: jsonData];
    NSDictionary * dict = [page yy_modelToJSONObject];
    NSLog(@"%@", dict);
}

- (void) first{
    NSString * path = [NSBundle.mainBundle pathForResource: @"one" ofType: @"json"];
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *jsonError;
    NSArray *json = [NSJSONSerialization JSONObjectWithData: jsonData options:kNilOptions error:&jsonError];
     
    Book * page = [Book yy_modelWithJSON: json];
    NSDictionary * dict = [page yy_modelToJSONObject];
    NSLog(@"%@", dict);
}


- (void) one{
    YYTestModelToJSON * try = [[YYTestModelToJSON alloc] init];
    [try testToJSON];
}


- (void) two{
    YYTestModelToJSON * try = [[YYTestModelToJSON alloc] init];
    [try testKeyPath];
}


- (void)testBlock {
    IntegerBlock block = ^{return 12;};
    NSDictionary *dic = @{@"v":block};
    YYTestAutoTypeModel *model = [YYTestAutoTypeModel yy_modelWithDictionary:dic];
    if (model.blockValue) {
        NSLog(@"%@", model.blockValue);
    }
    
    block = (id)model.blockValue;
    NSLog(@"%d", block() == 12);
    
}


@end








@implementation YYTestModelToJSON


- (void)testToJSON {
    YYTestModelToJSONModel *model = [YYTestModelToJSONModel new];
    model.intValue = 1;
    model.longValue = 2;
    model.unsignedLongLongValue = 3;
    model.shortValue = 4;
    model.array = @[@1,@"2",[NSURL URLWithString:@"https://github.com"]];
    model.set = [NSSet setWithArray:model.array];
    model.color = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    
    NSDictionary *jsonObject = [model yy_modelToJSONObject];
    NSLog(@"%d", [jsonObject isKindOfClass:[NSDictionary class]]);
    NSLog(@"%d", [jsonObject[@"int"] isEqual:@(1)]);
    NSLog(@"%d", [jsonObject[@"long"] isEqual:@(2)] || [jsonObject[@"long"] isEqual:@(3)]);
    NSLog(@"%d", [ ((NSDictionary *)jsonObject[@"ext"])[@"short"] isEqual:@(4)]);
    NSLog(@"%d", jsonObject[@"color"] != nil);
}

- (void)testKeyPath {
    YYTestKeyPathModelToJSONModel *model = [YYTestKeyPathModelToJSONModel new];
    model.a = @"a";
    model.b = @"b";
    model.c = @"c";
    model.d = @"d";
    model.e = @"e";
    model.f = @{};
    
    NSDictionary *dic = [model yy_modelToJSONObject];
    NSLog(@"\n\n\n%@", dic);
    NSDictionary *ext = dic[@"ext"];
    NSLog(@"%d", [ext[@"b"] isEqualToString:@"b"]);
    
    NSLog(@"%d", [ext[@"a"] isEqualToString:@"a"] || [ext[@"a"] isEqualToString:@"c"]);
    
    model.f = @{@"g" : @""};
    dic = [model yy_modelToJSONObject];
    NSLog(@"\n\n\n%@", dic);
}



@end
