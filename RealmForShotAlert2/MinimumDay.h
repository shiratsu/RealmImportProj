//
//  MinimumDay.h
//  RealmForShotAlert2
//
//  Created by 平塚　俊輔 on 2/24/15.
//  Copyright (c) 2015 平塚　俊輔. All rights reserved.
//

#import <Realm/Realm.h>

@interface MinimumDay : RLMObject
// Add properties here to define the model
@property NSString   *Code;
@property NSString   *Name;
@property NSInteger  id;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<MinimumDay>
RLM_ARRAY_TYPE(MinimumDay)

