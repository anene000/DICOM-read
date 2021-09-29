function [fid,param] = CheckCS(fid,temp,param)
        fidsize = 40;
        fidbacksize = fidsize + 2;
        
        hitzero=temp(0==temp);
        
        if(length(hitzero)>1)
            index = find(temp==0);
            backnum =  fidbacksize - index(1);
            fseek(fid,-1*backnum,'cof');
            tempword = char(temp(1:index(1))');
            param.value = tempword;
            
        else
            tempword = char(temp)';
            param.value = tempword;
            backnum = -8;
            fseek(fid,backnum,'cof');
        end
        
end