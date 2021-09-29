%{
A = fread(fileID) は、開いたバイナリ ファイルから列ベクトル A にデータを読み取り、
    ファイル ポインターをファイルの終端マーカーに配置します。バイナリ ファイルは
    ファイル識別子 fileID で示されます。fopen を使用すると、このファイルを開いて 
    fileID 値を取得できます。読み取りが終わったら、fclose(fileID) を呼び出してファイルを閉じます。
A = fread(fileID,sizeA) は、次元が sizeA の配列 A にファイル データを読み取り、
    読み取られた最後の値の後にファイル ポインターを配置します。fread は A にデータを列方向に入力します。
A = fread(fileID,sizeA,precision) は、precision に記述されている形式とサイズで
    ファイル内の値を解釈します。sizeA 引数はオプションです。
A = fread(fileID,sizeA,precision,skip) は、ファイルの各値を読み取った後、
    skip で指定されたバイト数またはビット数をスキップします。sizeA 引数はオプションです。
A = fread(fileID,sizeA,precision,skip,machinefmt) は、ファイルのバイトまたは
    ビットの読み取りの順序を追加で指定します。引数 sizeA と skip はオプションです。
%}
%clear all;
%close all;

param = dicom_struct;
CHAR_SIZE=1;
temp_fid = 0;
DICM = 'DICM';
num = 1;
global endian;
endian = 0; %1 = explisit, 2= implisit
global PixelFlag;
PixelFlag = 'FALSE';

[filename, pathname] = uigetfile('*.dcm');
testDCMFILE = fullfile(pathname, filename);

%testDCMFILE = '../114.dcm';
DICOM_ReadOpening = 128;
fid = fopen(testDCMFILE);
fseek(fid,DICOM_ReadOpening,'bof');
A = fread(fid,4,'char');
    if(isequal(char(A)',DICM)==0)
		disp('DICOMデータとして認識できません');		exit(1);
    end 
%fseek(fid,CHAR_SIZE*4,'cof');

for i=1:1:100
    if( feof(fid)), break, end
    [fid,param]=CheckDCM(fid, param);
    load('param.mat');
    CDicomdata(num)=param;
    if( CDicomdata(num).binarylength > 9000 ), break, end
    save CDicomdata;
    num = num+1;
end
fclose(fid);

load('ObjImage.mat');

if(exist('ObjImage','var')==1)
   DDimageData = BinaryImageConstruct(ObjImage);
   imwrite(uint8(DDimageData),'d.bmp');
else
    disp('画像情報が生成されていません');
end
%Bitmap生成

cd ./view3dgui/plot
