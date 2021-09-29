classdef dicom_struct < handle
     properties % csvで指定するパラメータ
        group = 0;
		element = 0;
		VR= [];
		length = 0;
		binarylength = 0;
		value = 0;
		FLAG = 0;
        index = 0;
     end
     
    %{
    methods
    function obj = Param
    global structparamfile;
    paramater=load(filename);
   
      % group
      obj.group = paramater(1);
      % element
      obj.element = paramater(2);
      % VR
      obj.VR = paramater(3); 
      % length
      obj.length = paramater(4); 
      % binary length
      obj.binarylength = paramater(5);
      %value
      obj.value = paramater(6);
      %FLAG
      obj.FLAG = paramater(7);
    end
    end
     %}
end