//
//  TasksDatesCollectionVIew.m
//  TodoListApp
//
//  Created by psagc on 27/03/24.
//

#import "TasksDatesCollectionView.h"
#import "TaskDateCell.h"

@interface TasksDatesCollectionView()
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
@end

@implementation TasksDatesCollectionView

- (instancetype)initWithArray:(NSArray<NSDate *> *)dates {
    self = [super init];
    if (self) {
        _array = dates;
        _selectedIndexPath = nil;
    }
    return self;
}

-(void)scrollToToday:(UICollectionView*)collectionView {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:currentDate];
    dateComponents.hour = 0;
    dateComponents.minute = 0;
    dateComponents.second = 0;
    NSDate *dateWithZeroTime = [calendar dateFromComponents:dateComponents];
    NSInteger desiredItemIndex = [self.array indexOfObject:dateWithZeroTime];
    if (desiredItemIndex != NSNotFound) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:desiredItemIndex inSection:0];
        UICollectionViewScrollPosition scrollPosition = UICollectionViewScrollPositionCenteredHorizontally; // Adjust as neededy
        BOOL animated = YES; // Set to YES if you want the scrolling to be animated
        self.selectedIndexPath = indexPath;
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
    } else {
        NSLog(@"Desired item not found in the data source array.");
    }
    
    
}

- (NSDate*)selectedDate {
    return [self.array objectAtIndex:self.selectedIndexPath.row];
}

#pragma mark - UICollectionViewDataSource

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TaskDateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TaskDateCell.reuseIdentifier forIndexPath:indexPath];
    [cell configureCellWith:[self.array objectAtIndex:indexPath.item] andSelected:indexPath == self.selectedIndexPath];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}

#pragma mark - UICollectionViewDelegates

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    [collectionView reloadData];
    if (self.selectedDateBlock) {
        self.selectedDateBlock([self.array objectAtIndex:indexPath.item]);
    }
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Calculate the size of each cell based on the collection view's width
    CGFloat collectionViewWidth = collectionView.bounds.size.width;
    CGFloat cellWidth = collectionViewWidth / 5.0; // Display 5 cells horizontally
    CGFloat cellHeight = collectionView.bounds.size.height; // Use the full height of the collection view
    
    return CGSizeMake(cellWidth, cellHeight);
}
@end
