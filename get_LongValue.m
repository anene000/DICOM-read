function [fid,param] = get_LongValue(fid,param)
    if(param.length == 4 || param.FLAG == 20)
        param.value = fread(fid,1,'long','l');
    else
        disp('long型不正読み込みの可能性があります');
    end
end