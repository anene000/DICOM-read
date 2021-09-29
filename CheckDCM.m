function [fid,param]= CheckDCM(fid, param)
                temp=[];
                global endian;
                
                if(endian == 0 || endian==1)
                
                    temp=fread (fid, 1,'int16');%group
                    param.group=int16(temp);

                    temp=fread (fid, 1,'int16');%element
                    param.element=int16(temp);

                    temp=fread (fid, 2,'int8');%VR
                    param.VR=char(temp)';
                    
                    explicit_dictionary(fid,param);
                    
                end
                
                if(endian == 2)
                    temp=fread (fid, 1,'int16');%group
                    param.group=int16(temp);

                    temp=fread (fid, 1,'int16');%element
                    param.element=int16(temp);
                    
                    temp=fread (fid, 1,'int32');%length
                    param.length=int32(temp);
                    
                    implisit_dictionary(fid,param);
                    
                end
            %{
                if(temp(1) == 30 && temp(2) == 0)
                     temp=fread (fid, 2,'int8');
                     if(temp(1) == 0 && temp(2) == 0)
                       param.VR='CS';
                       temp=fread (fid, 40,'*ubit8');
                     else
                       fseek(fid,-2,'cof');
                     end
                 elseif(temp(1) == 28 && temp(2) == 0)
                     %temp=fread (fid, 2,'int8');
                     %if(temp(1) == 0 && temp(2) == 0)
                        param.VR='UI'; 
                     %end
                 else
                       param.VR=char(temp)';
                 end
              %}
                
end

                    