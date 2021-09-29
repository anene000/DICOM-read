function [fid,param] = readVR_char(fid , param) 
            param.value=[];
            
			if(param.FLAG ~= 7)
			
				temp_2=fread (fid, 1,'int16'); %length
                param.length=int16(temp_2);
				%zeros(temp_2,param.length);
				temp_2=fread (fid, param.length,'int8');
                param.value =int8(temp_2)';
                
            else
			
                temp_length=fread (fid, 4,'int16');
                temp2_length=fread (fid,1,'int64'); %length
				param.binarylength =int64(temp2_length);              
                %zeros(temp_2,param.binarylength);
                temp_2 = fread (fid, param.binarylength,'int8');
                param.value = int8(temp_2);
            end
end                    