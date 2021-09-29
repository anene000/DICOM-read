function [fid,ObjImage] = SetImagedata(fid,outputImageData)

    load('CDicomdata.mat');
    
    if(exist('CDicomdata','var') == 0)
        disp('�t�@�C���ǂݍ��ݎ��s���܂���');
        return;
    end
    
    %Tag Acess
    imagegroup = [40,40,40,40,40,40,40,40,32736,32736];
    imageelement = [256,257,258,4,259,16,17,6,16,16];
    num = 1 ;
    %DicomImageTag = [];
     for yy=1:1:10
        for i=1:1:length(CDicomdata)
            temp_a = (find(CDicomdata(i).group==imagegroup(num) && CDicomdata(i).element==imageelement(num)));

            if(temp_a == 1)                   
                DicomImageTag(num) = CDicomdata(i);
                num = num + 1;
            end
        end
     end
    if(length(DicomImageTag)==7)
                    outputImageData.bitsAllocated	= int64(DicomImageTag(1).value(1));    %�����ăr�b�g

                    outputImageData.bitsStored		= int64(DicomImageTag(2).value(1));	%�i�[�r�b�g
                    outputImageData.highBit         = int64(DicomImageTag(3).value(1));	%���ʃr�b�g

                    %maxValueBase = 1;
                    %outputImageData.maxPixelValue	= maxValueBase << outputImageData.bitsStored;

                    outputImageData.photometric     = char(DicomImageTag(4).value);	%���x������� (0x0028,0x0004)
                    outputImageData.pixelRepresent  = int64(DicomImageTag(5).value(1));	%��f�\�� (0x0028,0x0103)
                        s = DicomImageTag(6).value(1); %DicomImageTag(6).value(1)+DicomImageTag(6).value(2)*100;
                        height = s; %hex2dec(num2str(s));
                    outputImageData.height			= int64(height);	%���摜���� (0x0028,0x0010)
                        s = DicomImageTag(7).value(1); %DicomImageTag(7).value(1)+DicomImageTag(7).value(2)*100;
                        width = s; %hex2dec(num2str(s));
                    outputImageData.width			= int64(width);	%���摜�� (0x0028,0x0011)

                    outputImageData.centerX		= outputImageData.width / 2;			%���摜���S���W
                    outputImageData.centerY		= outputImageData.height / 2;

                    outputImageData.scaleValue		= 1.0;

                    %outputImageData.rgbComposition	= int64(DicomImageTag(8)); %( 0x0028 , 0x0006 )

                        if(strncmp(outputImageData.photometric ,'MONOCHROME1' ,11) == 1)
                            bitsize = 1;
                        elseif(strncmp(outputImageData.photometric ,'MONOCHROME2',11 ) == 1)
                            bitsize = 1;
                        elseif(strncmp(outputImageData.photometric ,'RGB',3 ) == 1)
                            bitsize = 3;
                        end
                        
                    outputImageData.image_length    = outputImageData.height*outputImageData.width*bitsize; %��f���̃T�C�Y (0x7fe0,0x0010)
                    outputImageData.image			= fread(fid,outputImageData.image_length,'*ubit16','l');  %��f��� (0x7fe0,0x0010)

                    %outputImageData.interPolation = 'Nearest';

    end
    %save outputImageData;
end