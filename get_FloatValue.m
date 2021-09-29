function [fid,param] = get_FloatValue(fid,param)
    if(param.length == 2 || param.FLAG == 20)
        param.value = fread(fid,1,'float','l');
    else
        disp('floatŒ^•s³“Ç‚İ‚İ‚Ì‰Â”\«‚ª‚ ‚è‚Ü‚·');
    end
end