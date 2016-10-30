//
//  AFNTestModel.h
//  课堂任务1
//
//  Created by Adam on 2016/10/30.
//  Copyright © 2016年 YinY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFNTestModel : NSObject

@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * download;
@property(nonatomic, copy) NSString * icon;

+ (instancetype)AFNTestModelWithDict:(NSDictionary *)dict;

@end
