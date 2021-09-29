function [fid,param] = get_IntValue(fid,param)
    if(param.length == 4 && param.FLAG == 20)
        param.value = fread(fid,1,'int32','l');
    else
        disp('intŒ^•s³“Ç‚İ‚İ‚Ì‰Â”\«‚ª‚ ‚è‚Ü‚·');
    end
end