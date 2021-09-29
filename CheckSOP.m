function [param] = CheckSOP(param)
 global endian;
 dim =2;
  
 match = cell(dim,1);
 match{1} = ('1.2.840.10008.1.2.1');
 match{2} =('1.2.840.10008.1.2');

 if(param.group==2)
     if(strncmp(char(param.value),match{1},length(match{1}))==1)
         endian = 1;
     elseif(strncmp(char(param.value),match{2},length(match{2}))==1)
         endian = 2;
     end
 end
  %{
    load('CDicomdata');
    fidsize = 60;
    dim =20;
    temp=fread (fid, fidsize,'*ubit8','l');

     hitnumber=3;
     for i=1:1:length(CDicomdata)
         if(CDicomdata(1,i).group==2)
             match(hitnumber)=cellstr(char(CDicomdata(1,i).value));
             hitnumber = hitnumber +1;
         end
     end
   %}
 
    %{
    for i=1:1:hitnumber
         if(strncmp(match(i),char(temp'),length(match(i)))==1)
             tempsentence = char(temp(1:length(match(i)))');
             param.value = tempsentence;
             fseeksize = -1*(fidsize - length(tempsentence));
             fseek(fid,fseeksize,'cof');
         end
     end
    %}
 
end