function src2 = warp(src1, src2, H_inv)
[row,col,d] = size(src2);
for cnt1 = 1:row
    for cnt2 = 1:col
        coor = [cnt2;cnt1;1];
        tmp_coor = H_inv*coor;
        tmp_coor = tmp_coor/tmp_coor(end);
        tx = round(tmp_coor(1));
        ty = round(tmp_coor(2));
        a = tmp_coor(1) - tx;
        b = tmp_coor(2) - ty;
        
        if(tx>0 && tx<=col && ty>0 && ty<=row)
            for cnt3 = 1:d
                src2(cnt1,cnt2,d) = round(((1.0-a)*(1.0-b))*src1(ty,tx,d)...
                                         +(a*(1.0-b))*src1(ty,tx+1,d)...
                                         +((a*b))*src1(ty+x,tx+1,d)...
                                         +((1.0-a)*b)*src1(ty+1,tx,d))
            end
        end
        
    end
end
2;