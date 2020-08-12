function [mElim] = elim(m)
% First Column Eliminated Matrix mElim = elim(m)
% Written By: Csaba Nemeth 20090753
% Since: 2020-02-04
% Function elim accepts an arbitrary sized matrix m. Returns a matrix
% mElim of the same size in which - excluding the first row - the first
% column of each row is a 0. This is achieved through elementary row
% operations.

    %Pivot matrix and read into local variable.
    mElim = pivot(m);
    
    %For all rows starting from the second row:
    for row_index = 2:size(mElim,1)
        %Current row should be the current row subtracted by the scaled
        %first row.
        mElim(row_index,:) = mElim(row_index,:) - (mElim(row_index,1)/mElim(1,1)).*mElim(1,:);
    end %End for loop.
    
end %End Function elim(...).
