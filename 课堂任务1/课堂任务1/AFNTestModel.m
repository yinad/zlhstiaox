//
//  AFNTestModel.m
//  课堂任务1
//
//  Created by Adam on 2016/10/30.
//  Copyright © 2016年 YinY. All rights reserved.
//

#import "AFNTestModel.h"

@implementation AFNTestModel

+ (instancetype)AFNTestModelWithDict:(NSDictionary *)dict{
    AFNTestModel * model = [[AFNTestModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
