function [Cc, Cs, Pc, Cmp, Wc, Ct, Cmt] = CostCalc(p, rows)
% Import Tables from Excel


filename = 'CostAnalysis.xlsx';
CompRange = 'B4:I18';
LimSecRange = 'B23:I28';
ProCostRange = 'B36:J66';
MatSuitRange = 'B71:I81';
WasteCoRange = 'B86:I100';
TolRange = 'B104:Z112';
SurFinRange = 'C119:Z126';
CMTRange = 'B133:C146';

CompTab = xlsread(filename,CompRange)
LimSecTab = xlsread(filename,LimSecRange)
ProCostTab = xlsread(filename,ProCostRange)
MatSuitTab = xlsread(filename,MatSuitRange)
WasteCoTab = xlsread(filename,WasteCoRange)
TolTab = xlsread(filename,TolRange)
SurFinTab = xlsread(filename,SurFinRange)
CMTTab = xlsread(filename,CMTRange)


% Loop to make individual Cc, Cs, Pc, Cmp, Wc, Ct, Sf, Cm Arrays 
rows = 5;
load('testmatrix.mat','p')
disp(p)
for i = 1:rows
load('testmatrix.mat','p')
  
%% cc
a = (p(i,14));
b = (p(i,12));
c = (p(i,13));
d=b*c;

Cc(i,1) = CompTab(d,p(i,14));
l=1;
if p(i,18)<=0.4;
    l=1;
elseif p(i,18) >0.4 && p(i,18) <= 0.6;
    l=2;
elseif p(i,18) >0.6 && p(i,18) <= 1.0;
    l=3;
elseif p(i,18) >1.0 && p(i,18) <= 3.0;
    l=4;
elseif p(i,18) >3.0 && p(i,18) <= 5.0;
    l=5; 
elseif p(i,18) >5;
    l=6;
end
s=p(i,15);
%% Cs
Cs(i,1) = LimSecTab(l,s);


%% Pc
q=1;
if p(i,17)<=10;
    q=1;
elseif p(i,17) >10 && p(i,17) <=50
    q=2;
elseif p(i,17) >10 && p(i,17) <=50
    q=3;
elseif p(i,17) >50 && p(i,17) <=100
    q=4;
elseif p(i,17) >100 && p(i,17) <=200
    q=5;
elseif p(i,17) >200 && p(i,17) <=400
    q=6;
elseif p(i,17) >400 && p(i,17) <=600
    q=7;
elseif p(i,17) >600 && p(i,17) <=800
    q=8;
elseif p(i,17) >800 && p(i,17) <=1000
    q=9;
elseif p(i,17) >1000 && p(i,17) <=2000
    q=10;    
elseif p(i,17) >2000 && p(i,17) <=4000
    q=11;
elseif p(i,17) >4000 && p(i,17) <=6000
    q=12;
elseif p(i,17) >6000 && p(i,17) <=8000
    q=13;    
elseif p(i,17) >8000 && p(i,17) <=10000
    q=14;    
elseif p(i,17) >10000 && p(i,17) <=20000
    q=15;    
elseif p(i,17) >20000 && p(i,17) <=30000
    q=16;    
elseif p(i,17) >40000 && p(i,17) <=50000
    q=17;
elseif p(i,17) >50000 && p(i,17) <=60000
    q=18;    
elseif p(i,17) >60000 && p(i,17) <=70000
    q=19;    
elseif p(i,17) >70000 && p(i,17) <=80000
    q=20;    
elseif p(i,17) >90000 && p(i,17) <=100000
    q=21;    
elseif p(i,17) >100000 && p(i,17) <=200000
    q=22; 
elseif p(i,17) >200000 && p(i,17) <=400000
    q=23; 
elseif p(i,17) >400000 && p(i,17) <=600000
    q=24;     
elseif p(i,17) >600000 && p(i,17) <=800000
    q=25; 
elseif p(i,17) >800000 && p(i,17) <=1000000
    q=26;         
elseif p(i,17) >1000000 && p(i,17) <=1500000
    q=27;
elseif p(i,17) >1500000 && p(i,17) <=2000000
    q=28;
elseif p(i,17) >2000000 && p(i,17) <=2500000
    q=29;
elseif p(i,17) >2500000 && p(i,17) <=3000000
    q=30;
elseif p(i,17) >3000000 
    q=31;
end 
   
Pc(i,1) = ProCostTab(q,s);


%% Cmp
m = p(i,14);
Cmp(i,1) = MatSuitTab(m,s);
%% Wc
Wc(i,1) = WasteCoTab(d,s);

%% Ct
plan = p(i,22);
planCol = plan*s;
t=p(i,19);
if t <= 0.004
    y=1;
elseif t > 0.004 && t<=0.01
    y=2;
elseif t > 0.01 && t<=0.03
    y=3;
elseif t > 0.03 && t<=0.05
    y=4;
elseif t > 0.05 && t<=0.08
    y=5;
elseif t > 0.08 && t<=0.15
    y=6;
elseif t > 0.15 && t<=0.3
    y=7;
    elseif t > 0.3
    y=8;
end 
Ct(i,1) = TolTab(y,planCol);
%% Cmt
Cmt(i,1) = CMTTab(m,1);

disp(Cc)
disp(Cs)
disp(Pc)
disp(Cmp)
disp(Wc)
disp(Ct)
disp(Cmt)

end
%% Display Arrays

end

