function [fid,param] = get_ByteValue(fid,param)
    if(strcmp(param.VR,'OW')==1)
        temp = fread(fid,param.length,'*ubit8','l');
        if(strcmp(param.VR,'OW')==1)
            param.value = temp;
        else
            param.value = char(temp');
        end
    %else
    %   disp('double�^�s���ǂݍ��݂̉\��������܂�');
    %end
end