classdef dicomImageStruct < handle
     properties % csv�Ŏw�肷��p�����[�^
         
         %memoryFlag4=[f
             bitsAllocated  =   0;	%�����ăr�b�g
             bitsStored     =   0; 	%�i�[�r�b�g
             highBit        =   0;  %���ʃr�b�g

             minPixelValue  = 	0;  %�摜�ŏ���f�l
             maxPixelValue  = 	0;  %�摜�ő��f�l

             pixelRepresent =   0;  %��f�\��
             rgbComposition =   0;  %�ʍ\��
             height         =   0;  %���摜����
             width          =   0;  %���摜��
             image_length   = 	0;  %��f���̃T�C�Y
             SelectInterPolation = 'Nearest';
             centerX        =   0;
             centerY        =   0;
        %Coordinate centerCoodinate;	//���摜���S���W

        %memoryFlag1=[
             photometric    =   0;  %���x�������

        %memoryFlag8=[
             scaleValue     =   0;

        %memoryFlagU1=[
             image          =   0;      %��f���擪�A�h���X
     end
     %{
        methods % No method attributes
           function obj = set.bitsAllocated (obj,value) % Handle class
               if ~(value > 0)
                  error('Property value must be positive')
               else
                  obj.bitsAllocated = int64(value);
               end
           end
       end
     %}    
end