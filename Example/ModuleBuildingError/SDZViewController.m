//
//  SDZViewController.m
//  ModuleBuildingError
//
//  Created by zhangqian on 11/30/2022.
//  Copyright (c) 2022 zhangqian. All rights reserved.
//

#import "SDZViewController.h"

#import <ModuleBuildingError/SDZModuleObject.h> /// firstly: this module import masonry in it's SDZImportMasonryObject file, masonry's header will be compile in ` /Users/usename/Library/Developer/Xcode/DerivedData/ModuleCache.noindex`, when the private pod use` defines module`

#import <Masonry/Masonry.h> /// the compile found masonry's header has import from private module, then do noting. But the masonry not import, because SDZModuleObject has no masonry header

@interface SDZViewController ()

@end

@implementation SDZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SDZModuleObject *obj = [SDZModuleObject new];
    NSLog(@"%@", obj);
    
    /// how to resolve the error
    /// 1. use `@import ModuleBuildingError;` replace `#import <ModuleBuildingError/SDZModuleObject.h>`
    /// 2. import SDZImportMasonryObject as the same time;
    /// 3. remove `#import <Masonry/Masonry.h>` before  `#import <ModuleBuildingError/SDZModuleObject.h>`
    /// 4. in podfile use `pod 'Masonry', :modular_headers => true`
    /// 
    [MASConstraint new]; /// Declaration of 'MASConstraint' must be imported from module 'ModuleBuildingError.SDZImportMasonryObject' before it is required
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
