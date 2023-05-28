clc;clear
pkg load symbolic
syms x z
format short
fprintf('\n   * * * * Serie de TAYLOR * * * *\n\n')
f=input(" Escriba la funcion dependiente de [X] : ","s");
a=input("\n Defina el valor de [a] : ");
n=input(" Defina el valor de [n] repetiociones : ");
res=0;
for i=0:n-1
  F=diff(f,x,i);
  solv=subs(F,x,a);
  y=(x-a)^i;
  res+=((solv)*y)/factorial(i);
endfor
disp("\n Presione ENTER para continuar \n ")
warning off
pause
clc
fprintf("\n")
res
s=input("\n Defina el valor para [x] : ");
solv=subs(res,x,s)
fprintf("\n Solucion Aproximada : %d \n\n",double(solv))
fv=subs(f,x,s);
disp("\n Precione ENTER para observar el Error ")
pause
clc
era=abs(fv-solv);
err=abs(era/fv);
fprintf("\n Solucion Aproximada : %d ",double(solv))
fprintf("\n Solucion Real : %d \n",double(fv))
fprintf("\n Error ABSOLUTO : %d ", double(era))
fprintf("\n Error RELATIVO : %d \n\n", double(err))
z=0:0.1:2*pi;
hold on
grid on
plot(z,double(subs(f,x,z)),'k','linewidth',2)
plot(z,double(subs(res,x,z)),'m','linewidth',1)
hold off
title('\fontsize{20}FUNCIONES')
xlabel('VALOR DE X','linewidth',2)
ylabel({'FO: ' f , 'FT: ' char(res)})
legend('\fontsize{14}Fun. ORIGINAL','\fontsize{14}Fun. Aprox. de Taylor')
