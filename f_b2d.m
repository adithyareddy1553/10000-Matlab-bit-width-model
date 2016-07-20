function y=f_b2d(n)
    
   
   %Converting the Number to String


    n=strtrim(n);
    numadd=0;
    t=length(n);

    %----------------------------------------------------------------------
    if isempty(find(n=='.'))
        y=bin2dec(n);     
    else
    %----------------------------------------------------------------------
        j=find(n=='.');

        i_part=n(1:j-1);
        f_part=n(j+1:end);
        
        % Look for the indices of the fraction part which are ones and
        % a simple computation on it to convert to decimal
        d_fpart=sum(0.5.^find(f_part=='1'));
        
        y=f_b2d(i_part)+d_fpart; % Concatenate the results

    %----------------------------------------------------------------------
    end