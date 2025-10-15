function countupto(n)
     for i=1:n 
         showcount(i)
     end 
    function showcount(val)
        fprintf('Current count: %d\n',val);
    end 
end 
