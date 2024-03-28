//
//  TaskDateCell.h
//  TodoListApp
//
//  Created by psagc on 27/03/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskDateCell : UICollectionViewCell
+(NSString *)reuseIdentifier;
+(NSString *)nibName;
-(void)configureCellWith:(NSDate*)date andSelected:(Boolean)isSelected;
@end

NS_ASSUME_NONNULL_END
