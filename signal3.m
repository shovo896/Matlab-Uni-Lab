A=[ 12 3 -6 ;
    2 4   6 ;
    4 6  8];
B=[ 1 3 2 ;
    4 5 8 ;
    4 5 6
    ];


Dutee=size(A);
Cutie=size(B);

C=B.';

row_xhudi=A(2,:);
cols_hardi=A(:,[1,3]);

efty=A([2 3],:);
siyamPagol=det(A);
Ulta_siyam=inv(A);
err=norm(check_I-eye(3));
elemwise_prod=A.*Ulta_siyam;

A2=A.^2;

fprintf('The value of a is %d ',A);


