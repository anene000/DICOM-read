function [fid,param] = get_ShortValue(fid,param)
    if(param.length == 2 || param.FLAG == 20)
        param.value = fread(fid,1,'short','l');
    else
        disp('shortŒ^•s³“Ç‚İ‚İ‚Ì‰Â”\«‚ª‚ ‚è‚Ü‚·');
    end
end