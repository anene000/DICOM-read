function [fid,param] = get_IntValue(fid,param)
    if(param.length == 4 && param.FLAG == 20)
        param.value = fread(fid,1,'int32','l');
    else
        disp('int型不正読み込みの可能性があります');
    end
end