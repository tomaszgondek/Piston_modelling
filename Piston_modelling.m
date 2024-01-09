clear clc;
syms x;
fun1 = @(x) cos(x);
fun2 = @(x) 1./(1.+x.^2);
fun3 = @(x) 8./x;
res1 = integral(fun1, (pi/6), (pi/2));
res2 = integral(fun2, 0, 1);
res3 = integral(fun3, -15, -3);

a_1 = (pi/6);  
b_1 = (pi/2);


h_1 = 0.25; 

n_1 = (b_1-a_1)/h_1; 


s_1=0;
for i =0:n_1-1
    xn_1= a_1 + (i * h_1);
    s_1 = s_1 + fun1(xn_1);
end
Rectangle_1 = h_1 * s_1;


a_2 = (0);  
b_2 = (1);


h_2 = 0.25; 

n_2 = (b_2-a_2)/h_2; 


s_2=0;
for i =0:n_2-1
    xn_2= a_2 + (i * h_2);
    s_2 = s_2 + fun2(xn_2);
end
Rectangle_2 = h_2 * s_2;

a_3 = (-15);  
b_3 = (-3);


h_3 = 0.25; 

n_3 = (b_3-a_3)/h_3; 


s_3=0;
for i =0:n_3-1
    xn_3= a_3 + (i * h_3);
    s_3 = s_3 + fun3(xn_3);
end
Rectangle_3 = h_3 * s_3;

delta1 = abs(res1-Rectangle_1);
delta2 = abs(res2-Rectangle_2);
delta3 = abs(res3-Rectangle_3);

