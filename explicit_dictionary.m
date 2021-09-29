function explicit_dictionary(fid,param)
  global endian;

  if(strcmp(param.VR,'AE') == 1) 

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid , param);

  elseif( strcmp(param.VR,'AS') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'AT') == 1)

    param.FLAG = 1;
    %m_buf_value = readVR_char(br , buf_group , FLAG); %int�Œ�
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR,'CS') == 1)

    param.FLAG = 11;
    CheckCS(fid,temp,param);
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    %readVR_char(fid ,  param);
    clear temp;

  elseif(strcmp(param.VR, 'DA') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'DS') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'DT') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR,'FL') == 1) %float

    param.FLAG = 5;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'FD') == 1) %double

    param.FLAG = 6;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'IS') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'LO') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'LT') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'OB') == 1) %�o�C�i��������

    param.FLAG = 7;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'OF') == 1) %�o�C�i��������

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR,'OW') == 1) %�o�C�i��������

    param.FLAG = 7;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'PN') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'SH') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'SL') == 1)

    param.FLAG = 1;
    %m_buf_value = readVR_char(br , buf_group , FLAG);  %int
    readVR_char(fid ,  param);

  %{
  else if(strcmp(param.VR, 'SQ') == 1)
  {
  param.FLAG = 7;
  %m_buf_value = readVR_char(br , buf_group , FLAG);  %int
  readVR_char(br ,  param);
  }
  %}
  elseif(strcmp(param.VR, 'SS') == 1)

    param.FLAG = 2;
    %m_buf_value = readVR_char(br , buf_group , FLAG);  %int
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'ST') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'TM') == 1)

    param.FLAG = 11;
    %m_buf_value = readVR_char(br , buf_group , FLAG);
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'UI') == 1)

    param.FLAG = 11;
    %if(param.group == 8 && param.element== 22)
    %    CheckSOP(fid,param);
    %else
    CheckSOP(param);
    if(endian==0 || endian ==1)
        readVR_char(fid ,  param);
    end
    if(endian==2)
        if(param.group==2)
           readVR_char(fid ,  param);                           
        end
    end
    %end
  elseif(strcmp(param.VR, 'UL') == 1)

    param.FLAG = 4;
    %m_buf_value = readVR_char(br , buf_group , FLAG);  %unlong
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'UN') == 1)

    param.FLAG = 7;
    %m_buf_value = readVR_char(br , buf_group , FLAG);  %�o�C�i��������
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'US') == 1)

    param.FLAG = 3;
    %m_buf_value = readVR_char(br , buf_group , FLAG);  %unshort
    readVR_char(fid ,  param);

  elseif(strcmp(param.VR, 'UT') == 1)

      param.FLAG = 7;
      %m_buf_value = readVR_char(br , buf_group , FLAG);  %�����������
      readVR_char(fid ,  param);
      elseif(strcmp(param.VR, 'OB') == 1)
      param.FLAG = 12;
      fseek(fid,1,'cof');

    %delete [] param.VR;
    %return m_buf_value;
  end
                  
  save param;
end