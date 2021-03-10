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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testBlock];
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
