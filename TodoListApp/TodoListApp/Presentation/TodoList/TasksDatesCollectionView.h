//
//  TasksDatesCollectionView.h
//  TodoListApp
//
//  Created by psagc on 27/03/24.
//

#import <UIKit/UIKit.h>
typedef void(^SelectedDateBlock)(NSDate  *date);

@interface TasksDatesCollectionView : NSObject<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray<NSDate*> *array;
@property (nonatomic, copy) SelectedDateBlock selectedDateBlock;
-(instancetype)initWithArray:(NSArray<NSDate*> *)dates;
-(void)scrollToToday:(UICollectionView*)collectionView;
- (NSDate*)selectedDate;
@end


