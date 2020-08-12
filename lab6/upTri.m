function mUpTri = upTri(m)
% Upper Triangular Matrix mUpTri = upTri(m)
% Written By: Csaba Nemeth 20090753
% Since: 2020-02-04
% Function upTri accepts an arbitrary sized matrix m. Returns a matrix
% mUpTri, the upper triangular equivalant to m. 

    %Pivot matrix.
    mUpTri = pivot(m);
    
    %For all rows in pivoted matrix:
    for index = 1:size(mUpTri,1)
        
        %Each progressively smaller sub-matrix should be the sub-matrix
        %with elimination (applied by the function elim).
        mUpTri(index:end, index:end) = elim(mUpTri(index:end, index:end));
        
    end %End for loop.
    
end %End Function upTri(...).
