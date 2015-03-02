//
//  main.m
//  RealmForShotAlert2
//
//  Created by 平塚　俊輔 on 2/24/15.
//  Copyright (c) 2015 平塚　俊輔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "Area.h"
#import "StartDay.h"
#import "MinimumDay.h"
#import "MainJob.h"
#import "OptionTag.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Import Area");
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        
        NSArray *aryDef = [NSArray arrayWithObjects:@"StartDay", @"MinimumDay", @"MainJob" ,@"OptionTag", nil];
        
        // Import JSON
        NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
        NSError *error = nil;
        NSArray *areaDicts = [NSJSONSerialization JSONObjectWithData:jsonData
                                                               options:0
                                                                 error:&error];
        if (error) {
            NSLog(@"There was an error reading the JSON file: %@", error.localizedDescription);
            return 1;
        }
        
        
        // Add Person objects in realm for every person dictionary in JSON array
        int i=1;
        for (NSDictionary *areaDict in areaDicts) {
            Area *obj = [[Area alloc] init];
            obj.id = i;
            obj.AreaCode = areaDict[@"AreaCode"];
            obj.AreaName = areaDict[@"AreaName"];
            obj.PrefCode = areaDict[@"PrefCode"];
            obj.PrefName = areaDict[@"PrefName"];
            i++;
            [realm addObject:obj];
        }
        
        
        
        for (int i=0; i<aryDef.count; i++) {
            
            NSString *className = aryDef[i];
            NSLog(@"%@",className);
            
            // Import JSON
            NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:className ofType:@"json"];
            NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
            NSError *error = nil;
            
            NSLog(@"%@",jsonFilePath);
            
            NSArray *aryDicts = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                 options:0
                                                                   error:&error];
            if (error) {
                NSLog(@"There was an error reading the JSON file: %@", error.localizedDescription);
                return 1;
            }
            
            int i=1;
            for (NSDictionary *aryDict in aryDicts) {
                
                if(className == @"StartDay"){
                    StartDay *instance = [[StartDay alloc] init];
                    //NSLog(@"%@", instance);
                    
                    instance.id = i;
                    instance.Code = aryDict[@"Code"];
                    instance.Name = aryDict[@"Name"];
                    
                    i++;
                    [realm addObject:instance];
                }else if(className == @"MinimumDay"){
                    
                    MinimumDay *instance = [[MinimumDay alloc] init];
                    //NSLog(@"%@", instance);
                    
                    instance.id = i;
                    instance.Code = aryDict[@"Code"];
                    instance.Name = aryDict[@"Name"];
                    
                    i++;
                    [realm addObject:instance];
                }else if(className == @"MainJob"){
                    
                    MainJob *instance = [[MainJob alloc] init];
                    //NSLog(@"%@", instance);
                    
                    instance.id = i;
                    instance.Code = aryDict[@"Code"];
                    instance.Name = aryDict[@"Name"];
                    
                    i++;
                    [realm addObject:instance];
                }else if(className == @"OptionTag"){
                    
                    OptionTag *instance = [[OptionTag alloc] init];
                    //NSLog(@"%@", instance);
                    
                    instance.id = i;
                    instance.Code = aryDict[@"Code"];
                    instance.Name = aryDict[@"Name"];
                    
                    i++;
                    [realm addObject:instance];
                }
                
                
                
                
            }
            
            
            
        }
        [realm commitWriteTransaction];
        
        // Print all persons from realm
        for (MainJob *area in [MainJob allObjects]) {
            NSLog(@"person persisted to realm: %@", area);
        }

        for (MinimumDay *area in [MinimumDay allObjects]) {
            NSLog(@"person persisted to realm: %@", area);
        }
        
        for (StartDay *area in [StartDay allObjects]) {
            NSLog(@"person persisted to realm: %@", area);
        }
        for (Area *area in [Area allObjects]) {
            NSLog(@"person persisted to realm: %@", area);
        }
        for (OptionTag *area in [OptionTag allObjects]) {
            NSLog(@"person persisted to realm: %@", area);
        }
        
        NSError *error2 = nil;
        
        BOOL result = [realm writeCopyToPath:@"/Users/shhirats/Documents/shotalert.realm" error:&error2];
        NSLog(@"%@", error2);
        NSLog(@"%d", result);
        
        
    }
    return 0;
}

