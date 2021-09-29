classdef dicomImageStruct < handle
     properties % csvで指定するパラメータ
         
         %memoryFlag4=[f
             bitsAllocated  =   0;	%割当てビット
             bitsStored     =   0; 	%格納ビット
             highBit        =   0;  %高位ビット

             minPixelValue  = 	0;  %画像最小画素値
             maxPixelValue  = 	0;  %画像最大画素値

             pixelRepresent =   0;  %画素表現
             rgbComposition =   0;  %面構成
             height         =   0;  %生画像高さ
             width          =   0;  %生画像幅
             image_length   = 	0;  %画素情報のサイズ
             SelectInterPolation = 'Nearest';
             centerX        =   0;
             centerY        =   0;
        %Coordinate centerCoodinate;	//生画像中心座標

        %memoryFlag1=[
             photometric    =   0;  %光度測定解釈

        %memoryFlag8=[
             scaleValue     =   0;

        %memoryFlagU1=[
             image          =   0;      %画素情報先頭アドレス
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