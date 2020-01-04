function [DFAOutCell, DFARat] = CostCalc(p, n, cellp)
% Import Tables from Excel 
% clc
% load('testmat.mat','p')
disp(p)
disp('n=')
disp(n)
 
M = max(n(:,1));
disp(M)
filename = 'CostAnalysis.xlsx';
CompRange = 'B4:I18';
LimSecRange = 'B23:I28';
ProCostRange = 'B36:J66';
MatSuitRange = 'B71:I81';
WasteCoRange = 'B86:I100';
TolRange = 'B105:Z112';
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
for i = 1:M
%% Extracting from P 
Numb(i,1) = p(i,1);
V(i,1) = p(i,17);
FitInd(i,1) = p(i,2)+p(i,3)+p(i,4)+p(i,5);
FeedInd(i,1) = p(i,8)+p(i,9)+p(i,10)+p(i,11);
%% Cc -Ccomplexity factor

b = round((n(i,12)));
c = round((n(i,13)));
d=b*c;
disp('d=')
disp(d)
disp('n15=')
disp(n(i,15))
Cc(i,1) = CompTab(d,round(n(i,15))); 

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
s=round(p(i,15));
%% Cs - Minimum Section
Cs(i,1) = LimSecTab(l,s);


%% Pc - Processing Cost
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


%% Cmp - compelxity factor 
m = round(p(i,14));
Cmp(i,1) = MatSuitTab(m,s);
%% Wc - Waste coefficent 
Wc(i,1) = WasteCoTab(d,s);

%% Ct - tolerance factor 
plan = round(p(i,21));
if plan <=1
    x = 1;
elseif plan >1 && plan <=2
    x=2;
elseif plan >=3
        x=3;
    
end 

planCol = plan*s;

t=round(p(i,19));
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
g=x*round(p(i,15));
Ct(i,1) = TolTab(y,g);
end 

% Create table


%Cmt
Cmt(i,1) = CMTTab(round(p(i,14)),1);


end

Rc = Cc.*Cmp.*Ct
Mc = V.*Cmt.*Wc
Mi = Rc.*Pc+Mc
 disp('FitInd =')
 disp(FitInd)
 


%% Display Arrays
disp('Cc =')
disp(Cc)
disp('Cs =')
disp(Cs)
disp('Pc =')
disp(Pc)
disp('Cmp =')
disp(Cmp)
disp('Wc =')
disp(Wc)
disp('Ct =')
disp(Ct)
disp('Cmt =')
disp(Cmt)
disp('Rc =')
disp(Rc)
disp('Mc =')
disp(Mc)
disp('Mi =')
disp(Mi)

Cc, Cs, Pc, Cmp, Wc, Ct, Cmp;
disp(cellp(:,1))
disp(cellp(:,2))

fitRat = sum(FitInd)/max(n(:,1))
feeRat = sum(FeedInd)/max(n(:,1))
costRat = sum(Mi)

DFARat = horzcat(fitRat, feeRat, costRat)


% cellp(:,1), cellp(:,2)
DFAOut3 = horzcat(FitInd, FeedInd, Mi, Rc, Cc, Cmp, Cs, Ct, Pc, Mc, Wc);
disp(DFAOut3)
DFAOut2 = num2cell(DFAOut3)


DFAOut = horzcat(cellp(:,1), cellp(:,2), DFAOut2)


DFAOutCell = (DFAOut)
end

