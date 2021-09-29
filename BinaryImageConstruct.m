function [OutputObjImage] =BinaryImageConstruct(InputObjImage)

    BITS_IN_BYTE = 16;
    SET_GRADATION = 256;
    %pixelByteNumber = ( InputObjImage.bitsAllocated * ( InputObjImage.width * InputObjImage.height) / BITS_IN_BYTE );
    Lshift = (InputObjImage.bitsAllocated - InputObjImage.highBit+1 )/2;
	Rshift = (InputObjImage.bitsStored  - InputObjImage.bitsAllocated)/2;
    
    %c_BaseBits = cell(1,1);
    %for i=1:1: ( InputObjImage.height * pixelByteNumber ) 
    %    for j=1:1:InputObjImage.width  * pixelByteNumber
                        
            %Dicom�̉�f�f�[�^�����o�����߂̃}�X�N����
            maskBits = bitshift(InputObjImage.image, Lshift);

            %����Ȃ�������������ŉ�f�f�[�^����肾��
            %baseBits = 0;klhujjjj
            if(InputObjImage.bitsAllocated == BITS_IN_BYTE)

                baseBits = ( maskBits );

            elseif( InputObjImage.bitsAllocated == (2 * BITS_IN_BYTE) )

                baseBits =  uint16(maskBits)  ;

            end

            %�����ăr�b�g������K�v�Ȓl�����𔲂��o���ă��^�[��
            if( (InputObjImage.highBit + 1) == InputObjImage.bitsStored )
                c_BaseBits = bitshift(baseBits, Rshift);  % baseBits >> ( (InputObjImage.highBit + 1) - InputObjImage.bitsStored );
                d_BaseBits = c_BaseBits*(SET_GRADATION / 4096);
                dd_BaseBits = reshape(d_BaseBits,InputObjImage.height,InputObjImage.width);
                disp('�ϊ��������܂����@[LUT]');
            end
            %pixelcount = pixelcount + 1;
         %end
    %end
    OutputObjImage = dd_BaseBits';
    
end