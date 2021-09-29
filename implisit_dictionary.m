function [fid , param ] = implisit_dictionary(fid,param)
    global dictionary;
    global PixelFlag;
    
    VR_dictionary;
    
    %index= strfind(dictionary,param.group) && strfind(dictionary,param.element);  
    if(isempty(param.group) == 1 || isempty(param.element) == 1)
        return;
    else
        for i=1:1:length(dictionary)
            %x=dictionary(param.group==dictionary{i}{1});
            x = dictionary{i}{1}(param.group==dictionary{i}{1});
            if(~isempty(x)==1)
                 d = find(param.element==dictionary{i}{2});

                if(~isempty(x)==1&&~isempty(d)==1)
                    index = i;
                    param.index = index;
                    param.VR = dictionary{i}{3};
                        if(strcmp(param.VR,'OB')==1 && param.group==32736)
                            if(param.element==16)
                                PixelFlag = 'TRUE';
                            end
                        end
                    break;
                end
            end
        end
    end
    
    if(strcmp(PixelFlag,'TRUE'))
        
        param.binarylength = 99999;
        disp('画像格納データまで読み込みました');
        ObjImage = dicomImageStruct;
        SetImagedata(fid,ObjImage);
        %file_length チェック
            %if()
            %    fread(fid,param.length,'*ubit8','l');
            %end
        save ObjImage;
        return;
        
    else
        %{
        temp = fread(fid,param.length,'*ubit8','l'); %little
        [size1 , size2] = size(temp);
            if(size1 > 1) 
                param.value = temp';
            else
                param.value = temp;
            end
        %}
       read_VR_implisit(fid,param); 
    end
    
    %save param;
    
end