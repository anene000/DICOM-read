%{
A = fread(fileID) �́A�J�����o�C�i�� �t�@�C�������x�N�g�� A �Ƀf�[�^��ǂݎ��A
    �t�@�C�� �|�C���^�[���t�@�C���̏I�[�}�[�J�[�ɔz�u���܂��B�o�C�i�� �t�@�C����
    �t�@�C�����ʎq fileID �Ŏ�����܂��Bfopen ���g�p����ƁA���̃t�@�C�����J���� 
    fileID �l���擾�ł��܂��B�ǂݎ�肪�I�������Afclose(fileID) ���Ăяo���ăt�@�C������܂��B
A = fread(fileID,sizeA) �́A������ sizeA �̔z�� A �Ƀt�@�C�� �f�[�^��ǂݎ��A
    �ǂݎ��ꂽ�Ō�̒l�̌�Ƀt�@�C�� �|�C���^�[��z�u���܂��Bfread �� A �Ƀf�[�^�������ɓ��͂��܂��B
A = fread(fileID,sizeA,precision) �́Aprecision �ɋL�q����Ă���`���ƃT�C�Y��
    �t�@�C�����̒l�����߂��܂��BsizeA �����̓I�v�V�����ł��B
A = fread(fileID,sizeA,precision,skip) �́A�t�@�C���̊e�l��ǂݎ������A
    skip �Ŏw�肳�ꂽ�o�C�g���܂��̓r�b�g�����X�L�b�v���܂��BsizeA �����̓I�v�V�����ł��B
A = fread(fileID,sizeA,precision,skip,machinefmt) �́A�t�@�C���̃o�C�g�܂���
    �r�b�g�̓ǂݎ��̏�����ǉ��Ŏw�肵�܂��B���� sizeA �� skip �̓I�v�V�����ł��B
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
		disp('DICOM�f�[�^�Ƃ��ĔF���ł��܂���');		exit(1);
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
    disp('�摜��񂪐�������Ă��܂���');
end
%Bitmap����

cd ./view3dgui/plot
