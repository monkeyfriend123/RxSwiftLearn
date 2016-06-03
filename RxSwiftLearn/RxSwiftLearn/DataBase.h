//
//  DataBase.h
//  RxSwiftLearn
//
//  Created by js on 16/6/3.
//  Copyright © 2016年 js. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
@interface DataBase : NSObject

@property (nonatomic, strong,readonly) FMDatabaseQueue *dataBaseQueue;

- (instancetype)initWithPath:(NSString *)dbPath;

- (void)close;

@end
