function [fid,param] = get_DoubleValue(fid,param)
    if(param.length == 8 || param.FLAG == 20)
        param.value = fread(fid,1,'double','l');
    else
        disp('doubleŒ^•s³“Ç‚İ‚İ‚Ì‰Â”\«‚ª‚ ‚è‚Ü‚·');
    end
end