//
//  DataBase.m
//  RxSwiftLearn
//
//  Created by js on 16/6/3.
//  Copyright © 2016年 js. All rights reserved.
//

#import "DataBase.h"

@interface DataBase ()

@property (nonatomic, strong,readwrite) FMDatabaseQueue *dataBaseQueue;

@end

@implementation DataBase
- (instancetype)initWithPath:(NSString *)dbPath{
    self = [super init];
    if (self){
        
    }
    return self;
}



- (void)createFileIfNeeded:(NSString *)fullPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSString *fileName = fullPath.lastPathComponent;
    NSString *directory = fullPath.stringByDeletingLastPathComponent;
    
    BOOL isDirectory = NO;
    if (![fileManager fileExistsAtPath:directory isDirectory:&isDirectory]){
        
        NSError *error = nil;
        [fileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error];
        if (error){
            //创建文件夹失败
            return;
        }
    }
    
    
    if (![fileManager fileExistsAtPath:fullPath isDirectory:&isDirectory]){
        if (!isDirectory){
            [fileManager createFileAtPath:fullPath contents:nil attributes:nil];
        }
    }
}


- (void)close{
    [self.dataBaseQueue close];
}

@end
