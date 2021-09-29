function [fid,param] = get_ByteValue(fid,param)
    if(strcmp(param.VR,'OW')==1)
        temp = fread(fid,param.length,'*ubit8','l');
        if(strcmp(param.VR,'OW')==1)
            param.value = temp;
        else
            param.value = char(temp');
        end
    %else
    %   disp('doubleŒ^•s³“Ç‚İ‚İ‚Ì‰Â”\«‚ª‚ ‚è‚Ü‚·');
    %end
end