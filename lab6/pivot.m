function [mPivot] = pivot(m)
% Pivoted Matrix mPivot = pivot(m).
% Written By: Csaba Nemeth 20090753
% Since: 2020-02-04
% Function pivot accepts an arbitrary sized matrix m and switches the first
% row with the row containing the largest element in the first column. Returns a matrix mPivot
% with the same dimensions.

    %Read matrix into local variable and initialize the maximum element as
    %0.
    mPivot = m;
    max_elem = 0;

    %Loop through matrix rows and save index of row containing the largest
    %element in the first column.
    for row_index = 1:size(mPivot,1)
        curr_elem = abs(mPivot(row_index,1));
        if  curr_elem > max_elem
            max_row_index = row_index;
            max_elem = curr_elem;
        end %End check to see if current element is larger.
    end %End for loop.
    
    %Swap first row with row containing largest element.
    transfer_row = mPivot(1,:);
    mPivot(1,:) = mPivot(max_row_index,:);
    mPivot(max_row_index,:) = transfer_row;
    
end %End Function Pivot(...).

