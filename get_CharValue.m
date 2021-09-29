function [fid,param] = get_CharValue(fid,param)

    if(param.length > 9 && param.FLAG == 50)
        temp = fread(fid,param.length,'*ubit8','l');
        param.value = temp;
    else
        temp = fread(fid,param.length,'*ubit8','l');       
        param.value = char(temp');
    end
end