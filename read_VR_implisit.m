function [fid,param] = read_VR_implisit(fid,param)
        global endian;
        if(endian ==2)
                if(strcmp(param.VR,'AT') == 1) 

					param.FLAG = 20;
					get_IntValue(fid , param);
                    
                elseif( strcmp(param.VR,'US') == 1)

                    param.FLAG = 20;
                    get_ShortValue(fid , param);
					%readVR_char(fid ,  param);
				
                elseif(strcmp(param.VR, 'SS') == 1)
					
					param.FLAG = 20;
					get_ShortValue(fid , param);
			    
                elseif(strcmp(param.VR,'UL') == 1)
					
					param.FLAG = 20;
                    get_ByteValue(fid , param);
                    %CheckCS(fid,temp,param);
					%readVR_char(fid ,  param);
				
                elseif(strcmp(param.VR, 'SL') == 1)
					
					param.FLAG = 20;
					get_LongValue(fid , param);
				
                elseif(strcmp(param.VR, 'FL') == 1)
					
					param.FLAG = 20;
					get_FloatValue(fid , param);
				
                elseif(strcmp(param.VR, 'FD') == 1)
					
					param.FLAG = 20;
					get_DoubleValue(fid , param);
				
                elseif(strcmp(param.VR,'OW') == 1) %float
					
					param.FLAG = 30;
					get_ByteValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'OB') == 1) %double
				
					param.FLAG = 30;
					get_ByteValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'UN') == 1)
				
					param.FLAG = 30;
					get_ByteValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'SQ') == 1)
				
					param.FLAG = 30;
					get_ByteValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'JP') == 1)
				
					param.FLAG = 30;
					get_ByteValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'CS') == 1) %バイナリ無制限
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'DS') == 1) %バイナリ無制限
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
				
                elseif(strcmp(param.VR,'DT') == 1) %バイナリ無制限
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'IS') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'LO') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'LT') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'PN') == 1)
				
					param.FLAG = 50;
					get_CharValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'SH') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'ST') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
				
                elseif(strcmp(param.VR, 'TM') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);

                elseif(strcmp(param.VR, 'UT') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
    			
                elseif(strcmp(param.VR, 'UI') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
    			
               elseif(strcmp(param.VR, 'DA') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
                    
    			elseif(strcmp(param.VR, 'AS') == 1)
				
					param.FLAG = 40;
					get_CharValue(fid ,  param);
                end               
                save param;
        end
end