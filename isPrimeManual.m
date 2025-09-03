function isPrime=isPrimeManual(n)
       if n<=1:
          isPrime=false;
          return ;
       end 
       isPrime=true;
       for i=2:sqrt(n)
           if mod(n,i)==0
               isPrimne=false;
               return;
           end 
       end 
end 