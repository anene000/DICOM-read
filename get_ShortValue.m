function [fid,param] = get_ShortValue(fid,param)
    if(param.length == 2 || param.FLAG == 20)
        param.value = fread(fid,1,'short','l');
    else
        disp('short型不正読み込みの可能性があります');
    end
end