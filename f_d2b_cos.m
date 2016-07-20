function z=f_d2b_cos(n,m)
  
   strn=strtrim(num2str(n));
     
    %------------------------------------------------
    if isempty(find(strn=='.'))   
          if(n == 0)
            g1 = 0;
        else
            g1 = d2b(n);
        end  
        y  = strcat(g1,'.','0000000000000000000000000000000000000');
        k1 = find(y =='.');
        i_part1 = y(1:k1);
        f_part1 = y(k1+1:k1+m);
        z=strcat(i_part1,f_part1);
        return;        
    else
    %------------------------------------------------
        k = find(strn =='.');

    end
    
    
    %Retrieving INTEGER and FRACTIONAL PARTS as strings
    i_part=strn(1:k-1);
    f_part=strn(k:end);
    
    
    %Converting the strings back to numbers
    ni_part=str2num(i_part);
    nf_part=str2num(f_part);
    
    ni_part=d2b(ni_part);
      
    strtemp='';
    

    
    temp=nf_part;
    %-------------------------------------------------
    t='1';s='0';
    
    while nf_part>= 0
        nf_part=nf_part*2;
        if (nf_part==1) || (nf_part==temp)
            strtemp=strcat(strtemp,t);
            break;
        elseif nf_part>1
            strtemp=strcat(strtemp,t);
            nf_part=nf_part-1;
        else
            strtemp=strcat(strtemp,s);
        end
    end
    
     if(i_part=='0')
        y=strcat('0.',strtemp,'00000000000000000000');
         
     else
        y=strcat(ni_part,'.',strtemp,'00000000000000000000');
     end
     %------------------------------------------------
     
      k1 = find(y =='.');
      i_part1 = y(1:k1);
      f_part1 = y(k1+1:k1+m);
      
      z=strcat(i_part1,f_part1);
   end
    
  