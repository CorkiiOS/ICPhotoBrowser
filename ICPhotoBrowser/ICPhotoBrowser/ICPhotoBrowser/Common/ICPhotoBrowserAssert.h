//
//  ICPhotoBrowserAssert.h
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/16.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#ifndef ICPhotoBrowserAssert_h
#define ICPhotoBrowserAssert_h


#ifndef ICAssert
#define ICAssert( condition, ... ) NSCAssert( (condition) , ##__VA_ARGS__)
#endif // ICAssert

#ifndef ICFailAssert
#define ICFailAssert( ... ) ICAssert( (NO) , ##__VA_ARGS__)
#endif // IGFailAssert

#ifndef ICParameterAssert
#define ICParameterAssert( condition ) ICAssert( (condition) , @"Invalid parameter not satisfying: %@", @#condition)
#endif // ICParameterAssert


#endif 
