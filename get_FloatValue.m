function [fid,param] = get_FloatValue(fid,param)
    if(param.length == 2 || param.FLAG == 20)
        param.value = fread(fid,1,'float','l');
    else
        disp('float型不正読み込みの可能性があります');
    end
end