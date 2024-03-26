//
//  ReusableViewProtocol.h
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import <Foundation/Foundation.h>

@protocol ReusableViewProtocol <NSObject>

+(NSString*)defaultReuseIdentifier;

@end

@protocol NibLoadableViewProtocol <NSObject>

+(NSString*)nibName;

@end

@protocol UIViewCellRegisterProtocol <NSObject>

-(void)registerCell:(Class<ReusableViewProtocol>) type;
-(void)registerCellNib:(Class<NibLoadableViewProtocol, ReusableViewProtocol>) type;

@end
