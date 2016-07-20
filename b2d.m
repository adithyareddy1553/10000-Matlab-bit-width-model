function t = b2d(q)
 t  = 0;
  for f = 0:1
     if(q(1,2-f:2-f))
     t = t + 2^(f);
     else
     t = t + 0;
     end
  end
end