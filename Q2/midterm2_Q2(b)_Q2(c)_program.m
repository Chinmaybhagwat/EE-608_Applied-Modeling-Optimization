clf
format short;
syms x1 x2;
F=(x1-1)^2+2*(x2-2)^2; %Given function
H1x=1-x1^2-x2^2; 
H2x=x1+x2; 
x=[0.5 0.5];
e=0.002;
c=1;
true=1;
epoch=0;
while(true)
    epoch=epoch+1;
 
    B=(F+c*(-log(H1x)-log(H2x))^2); % Barrier function
    DB=[diff(B,x1);diff(B,x2)];

    Hessien=[diff(DB(1),x1) diff(DB(1),x2); %Finding Hessien values
      diff(DB(2),x1) diff(DB(2),x2)];

      DB_val=subs(DB,x1,x(1));
      DB_val=subs(DB_val,x2,x(2));
      Hessien_val=subs(Hessien,x1,x(1));
      Hessien_val=subs(Hessien_val,x2,x(2));
 
 
alpha=vpa((DB_val'*DB_val)/(DB_val'*Hessien_val*DB_val)); 

 eucledian=norm(alpha*DB_val);
 if(e<=eucledian);
  F_val=subs(F,x1,x(1));
  F_val=subs(F_val,x2,x(2));
 
  stepsize1=alpha*DB_val(1);
  stepsize2=alpha*DB_val(2);
 
  x1_new=vpa(x(1)-stepsize1);
  x2_new=vpa(x(2)-stepsize2);
  x=[x1_new x2_new];
 
  c=c*0.5;
  result_matrix= [double(epoch) double(x(1)) double(x(2)) double(F_val)];
  
 else

 true=0;
 end
 end
%% 
ResultTable(epoch,:)=result_matrix
X1v = ResultTable(:,2)
X2v = ResultTable(:,3)
dx1v = gradient(X1v) ;
dx2v = gradient(X2v) ;

figure(2) %Figure to show values connected by lines with arrows
hold on
fcontour(B,'LineWidth',1)
hold on

scatter(X1v,X2v,'filled')
quiver(X1v, X2v, dx1v, dx2v)
hold on
xlim([0.35 0.5])
ylim([0.73 0.92])
grid on
hold on