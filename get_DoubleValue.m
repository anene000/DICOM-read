function [fid,param] = get_DoubleValue(fid,param)
    if(param.length == 8 || param.FLAG == 20)
        param.value = fread(fid,1,'double','l');
    else
        disp('double型不正読み込みの可能性があります');
    end
end