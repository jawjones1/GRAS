%% Initialisation of Figure 
function dataentryGUI

%Initilaise Variables

% Initialise figure
f = figure;
fig = get(groot,'CurrentFigure');
set(f,'windowstyle','normal','position', [0 0 1000 500],'units','normalized')
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);

% Formatting figure
% Tabs
tabgp = uitabgroup(f,'Position',[.005 .01 .99 .99]);
tab1 = uitab(tabgp,'Title','Data Entry');
tab2 = uitab(tabgp,'Title','DFA Metrics');
tab3 = uitab(tabgp,'Title','Graphical Assembly Plan');


 
  
  
pa1 = uipanel(tab1,'Title','Fitting',...
             'Position',[.01 .01 .33 .94]);
pa2 = uipanel(tab1,'Title','Feeding',...
             'Position',[.34 .01 .33 .94]);
pa3 = uipanel(tab1,'Title','Cost',...
             'Position',[.67 .01 .32 .94]);
         
%% Tab 1 
% Titles
% Misc
Partdisp = uicontrol(tab1,'Style','text',...
                'String','Editing Part 1 of xxxx ',...
                'Position',[500 570 200 20]); 
            
            
NumPartStat = uicontrol(tab1,'Style','text',...
                'String','Number of Parts',...
                'Position',[2 570 160 12]); 
            
NamePartStat = uicontrol(tab1,'Style','text',...
                'String','Part Name',...
                'Position',[120 570 200 12]);
% Titles
% Fitting
HanDifStat = uicontrol(tab1,'Style','text',...
                'String','Placing and Feeding',...
                'Position',[20 515 270 12]); 
                
ProDirStat = uicontrol(tab1,'Style','text',...
                'String','Process and Direction',...
                'Position',[20 415 270 12]);             

                  
InserStat = uicontrol(tab1,'Style','text',...
                'String','Insertion',...
                'Position',[20 345 270 12]); 

AceVisStat = uicontrol(tab1,'Style','text',...
                'String','Acess and Vision',...
                'Position',[20 275 270 12]); 

AligStat = uicontrol(tab1,'Style','text',...
                'String','Alignment',...
                'Position',[20 205 270 12]); 
            
InsForcStat = uicontrol(tab1,'Style','text',...
                'String','Insertion Force',...
                'Position',[20 145 270 12]);             

% Titles
% Feeding

SizWeiStat = uicontrol(pa2,'Style','text',...
                'String','Size & Weight',...
                'Position',[20 470 270 50]); 
            
OrientStat = uicontrol(pa2,'Style','text',...
                'String','Orientation of Part',...
                'Position',[20 385 270 50]); 
            
HanDifStat = uicontrol(pa2,'Style','text',...
                'String','Handling Difficulties',...
                'Position',[20 310 270 50]);  

RotOriStat = uicontrol(pa2,'Style','text',...
                'String','Rotaitional Orientation',...
                'Position',[20 180 270 50]); 
            
            
            
Esse = uicontrol(pa2,'Style','text',...
                'String','Essential Part',...
                'Position',[20 105 270 50]);             
% Titles
% Cost    
ShapFacStat = uicontrol(pa3,'Style','text',...
                'String','Shape',...
                'Position',[20 470 270 50]); 
GeoFeatStat = uicontrol(pa3,'Style','text',...
                'String','Geometic Features',...
                'Position',[20 400 270 50]);            
            
MatStat = uicontrol(pa3,'Style','text',...
                'String','Material',...
                'Position',[20 320 270 50]);
            
PrimProStat = uicontrol(pa3,'Style','text',...
                'String','Primary Process',...
                'Position',[20 237 270 50]);            
            
VolStat = uicontrol(pa3,'Style','text',...
                'String','Volume',...
                'Position',[20 130 150 50]);
            
Quant.Stat = uicontrol(pa3,'Style','text',...
                'String','Quantiy per Anum',...
                'Position',[20 100 150 50]);            
            
LimSec.Stat = uicontrol(pa3,'Style','text',...
                'String','Limmiting Section',...
                'Position',[20 70 150 50]);            
            
Tol.Stat = uicontrol(pa3,'Style','text',...
                'String','Tolerance Information',...
                'Position',[20 40 150 50]);

Plan.Stat = uicontrol(pa3,'Style','text',...
                'String','Tolerance Planes',...
                'Position',[20 20 150 50]);
            
            
            
%tab 2 Table Titles            

            
           
            
            
% Create GUI components
% Buttons 
NexPart = uicontrol(tab1,'Style','pushbutton','String','Next Part',...
                'Position',[1100 20 100 40],...
                'Callback', @NexPart_Callback);
            
                
                
PrePart = uicontrol(tab1,'Style','pushbutton','String','Previous Part',...
                'Position',[50 20 100 40],...
                'Visible', 'on',...
                'Enable', 'off',...
                'Callback', @PrePart_Callback);

SavePart.But = uicontrol(tab1,'Style','pushbutton','String','Save Parts',...
                'Position',[1000 20 100 40],...
                'Visible', 'on',...
                'Enable', 'on',...
                'Callback', @SavePartBut_Callback); 
            
            
            
ResetParts.But = uicontrol(tab1,'Style','pushbutton','String','Reset Parts',...
                'Position',[900 20 100 40],...
                'Visible', 'on',...
                'Enable', 'on',...
                'Callback', @ResetPartsBut_Callback); 
            
% GUI Comp                  
% Listboxes
% Fitting
PlaFee = uicontrol(pa1,'Style','listbox',...
                'String',{'Self holding orientation','Requires holding','Self-securing','Screwing','Riveting','Bending'},...
                'Position', [20 430 270 70],...
                'Tag','Plafee',...
                'Callback', (@PlaFee_Callback));
            
            
ProDir = uicontrol(pa1,'Style','listbox',...
                'String',{'Straight line from above','Straight line not from above','Not straight line'},...
                'Position', [20 360 270 40],....
                'Callback', @ProDir_Callback);
           
Inser = uicontrol(pa1,'Style','listbox',...
                'String',{'Single','Multiple insertions','Not a straight line'},...
                'Position', [20 290 270 40],....
                'Callback', @Inser_Callback);  
            
            
AceVis = uicontrol(pa1,'Style','listbox',...
                'String',{'Direct','Restricted'},...
                'Position', [20 230 270 30],....
                'Callback', @AceVis_Callback);  
            
            
Alig = uicontrol(pa1,'Style','listbox',...
                'String',{'Easy to align','Not easy'},...
                'Position', [20 160 270 30],....
                'Callback', @Alig_Callback);  
            
InsForc = uicontrol(pa1,'Style','listbox',...
                'String',{'No resistance','Resistance'},...
                'Position', [20 100 270 30],....
                'Callback', @InsForc_Callback);  
% LB Feeding
SizWei = uicontrol(pa2,'Style','listbox',...
                'String',{'Very small - tools','Convenient - hands','Large/heavy - handS','Heavy - hoist'},...
                'Position', [20 450 270 50],...
                'Tag','Plafee',...
                'Callback', (@SizWei_Callback));
            
            
Orient = uicontrol(pa2,'Style','listbox',...
                'String',{'Symetical','end to end - easy','End to end - hard'},...
                'Position', [20 370 270 50],...
                'Tag','Plafee',...
                'Callback', (@Orient_Callback)); 
            
            
HanDif = uicontrol(pa2,'Style','listbox',...
                'String',{'Delicate','Flexible','Sticky','Severely Nest','Sharp/Abraisive','Untouchable','Gripping problem','No difficulties'},...
                'Position', [20 240 270 100],...
                'Tag','Plafee',...
                'Callback', (@HanDif_Callback));
            
RotOri= uicontrol(pa2,'Style','listbox',...
                'String',{'Rotational Symetry','Rotational - easy','Rotational - hard'},...
                'Position', [20 160 270 50],...
                'Tag','Plafee',...
                'Callback', (@RotOri_Callback)); 
            
Esse= uicontrol(pa2,'Style','listbox',...
                'String',{'Essential','non-essential'},...
                'Position', [20 90 270 50],...
                'Tag','Plafee',...
                'Callback', (@Esse_Callback)); 
            
% LB Cost Index
ShapFac= uicontrol(pa3,'Style','listbox',...
                'String',{'Cylindrical','Prismatic','Thin-walled'},...
                'Position', [20 450 270 40],...
                'Tag','Plafee',...
                'Callback', (@ShapFac_Callback));

GeoFeat= uicontrol(pa3,'Style','listbox',...
                'String',{'Select Shape'},...
                'Position', [20 370 270 60],...
                'Tag','Plafee',...
                'Callback', (@GeoFeat_Callback));

Mat= uicontrol(pa3,'Style','listbox',...
                'String',{'Cast iron','Low-C Steel','Alloy Steel','Stainless Steel','Copper Alloys','Aluminium Alloys','Zinc Alloys','Thermoplastic','Thermoset','Elastomer','Other'},...
                'Position', [20 290 270 60],...
                'Tag','Plafee',...
                'Callback', (@Mat_Callback));
            
            
PrimPro= uicontrol(pa3,'Style','listbox',...
                'String',{'Impact ext.','Snd Cast','Die Cast','Forge','Press','Machine','Powder Net','Plastic Mould'},...
                'Position', [20 210 270 60],...
                'Tag','Plafee',...
                'Callback', (@PrimPro_Callback));

% Edit Text

NamePartEdit = uicontrol(tab1,'Style','edit',...
                'String',' ',...
                'Position',[260 570 100 20],...
                'Callback', @NamePartEdit_Callback);

NumPartEdit = uicontrol(tab1,'Style','edit',...
                'String','  ',...
                'Position',[130 570 20 20],...
                'Callback', @NumPartEdit_Callback);

            
VolEdit = uicontrol(pa3,'Style','edit',...
                'String','m3',...
                'Position',[190 160 100 20],...
                'Callback', @VolEdit_Callback);
            
QuantEdit = uicontrol(pa3,'Style','edit',...
                'String','Units/Anum ',...
                'Position',[190 130 100 20],...
                'Callback', @QuantEdit_Callback);            
            
            
LimSecEdit = uicontrol(pa3,'Style','edit',...
                'String','mm',...
                'Position',[190 100 100 20],...
                'Callback', @limSecEdit_Callback);            
            
            
TolEdit = uicontrol(pa3,'Style','edit',...
                'String','mm',...
                'Position',[190 70 100 20],...
                'Callback', @TolEdit_Callback);
            
            
PlanEdit = uicontrol(pa3,'Style','edit',...
                'String',' ',...
                'Position',[190 50 100 20],...
                'Callback', @PlanEdit_Callback);
            
% Callbacks
% Buttons


% p = zeros([rows 25])
global p
global input
global rows
global cellp
PCount=1;
p(1,1)=1;

if  PCount == 1;
    set(PrePart,'Enable','off')
elseif PCount >=2;
    set(PrePart,'Enable','on')
end 

 function NexPart_Callback(~, ~)
     disp(p)
    PCount = PCount+1;
    disp(PCount);
    p(PCount,1)= PCount;
     s= num2str(PCount);
     s1= 'Editing Part ';
     s3= 'of';
     s4= input;
     s5=' ';
     sn = sprintf ('%s %s',s1,s,s5,s3,s5,s4);
     Partdisp.String = sn;
    
    if  PCount == 1;
    set(PrePart,'Enable','off')
    elseif PCount >=2;
    set(PrePart,'Enable','on')
    end 
    p(PCount,1)=PCount 
 end
    
 function PrePart_Callback(hObject, handles, eventdata)
     PCount = PCount-1 ;
     disp(PCount);
     p(PCount,1)= PCount;
     
     s= num2str(PCount);
     s1= 'Editing Part ';
     s3= 'of';
     s4= input;
     s5= ' ';
     sn = sprintf ('%s %s',s1,s,s5,s3,s5,s4);
     Partdisp.String = sn;
     
     if  PCount == 1;
     set(PrePart,'Enable','off')
     elseif PCount >2;
     set(PrePart,'Enable','on')
     end 
     p(PCount,1)=PCount 
    
 end
     
 function SavePartBut_Callback (handles, hObject, eventdata)
     
        %save ('bigbmatrix.mat','p');
        %save ('cellarray.mat','cellp');
        %part = MatToStruct(rows,p);
        disp(p)
        [Cc, Cs, Pc, Cmp, Wc, Ct, Cmt] = CostCalc(p, rows);
       
 end

function ResetPartsBut_Callback (handles, hObject, eventdata)
        p=zeros([rows 25]);
        disp(p)
        
        part = MatToStruct(rows);
 end
     
% CB Fitt Listboxes
function PlaFee_Callback(handles, hObject, eventdata)
     
       h = handles.Value;
       str = PlaFee.String;
            if h==1 ;
            p(PCount,2)=1;
            cellp{PCount,2}=str{1,1};
            elseif h==2
            p(PCount,2)=2;
            cellp{PCount,2}=str{2,1};
            elseif h==3
            p(PCount,2)=1.3;
            cellp{PCount,2}=str{3,1};
            elseif h==4
            p(PCount,2)=4;
            cellp{PCount,2}=str{4,1}; 
            elseif h==5
            p(PCount,2)=4;
            cellp{PCount,2}=str{5,1}; 
            elseif h==6
            p(PCount,2)=4;
            cellp{PCount,2}=str{6,1}; 
            disp(p)
            disp(cellp)
            end
end

function ProDir_Callback(handles, hObject, eventdata)
     
       h = handles.Value;
       str = ProDir.String;
            if h==1 ;
            p(PCount,3)=0;
            cellp{PCount,3}=str{1,1};
            elseif h==2
            p(PCount,3)=0.1;
            cellp{PCount,3}=str{2,1};
            elseif h==3
            p(PCount,3)=1.6;
            cellp{PCount,3}=str{3,1};
            end
end

function Inser_Callback(handles, hObject, eventdata)
     
       h = handles.Value;
       str = Inser.String;
            if h==1 ;
            p(PCount,4)=0;
            cellp{PCount,4}=str{1,1};
            elseif h==2
            p(PCount,4)=0.7;
            cellp{PCount,4}=str{2,1};
            elseif h==3
            p(PCount,4)=1.2;
            cellp{PCount,4}=str{3,1};
            disp(p)
            disp(cellp)
            end
end

function AceVis_Callback(handles, hObject, eventdata)
     
       h = handles.Value;
       str = AceVis.String;
            if h==1 ;
            p(PCount,5)=0;
            cellp{PCount,5}=str{1,1};
            elseif h==2
            p(PCount,5)=1.5;
            cellp{PCount,5}=str{2,1};
            disp(p)
            end
end

function Alig_Callback(handles, hObject, eventdata)
     
       h = handles.Value;
       str = Alig.String;
            if h==1 ;
            p(PCount,6)=0;
            cellp{PCount,6}=str{1,1};
            elseif h==2
            p(PCount,6)=0.7;
            cellp{PCount,6}=str{2,1};
            disp(p)
            end
end

function InsForc_Callback(handles, hObject, eventdata)
     
       h = handles.Value;
       str = InsForc.String;
            if h==1 ;
            p(PCount,7)=0;
            cellp{PCount,7}=str{1,1};
            elseif h==2
            p(PCount,7)=0.6;
            cellp{PCount,7}=str{2,1};
            disp(p)
            end
end

% CB Feed Listboxes

function SizWei_Callback(handles, hObject, eventdata)
     
       h = handles.Value;
       str = SizWei.String;
            if h==1 ;
            p(PCount,8)=1.5;
            cellp{PCount,8}=str{1,1};
            elseif h==2
            p(PCount,8)=1;
            cellp{PCount,8}=str{2,1};
            elseif h==3
            p(PCount,8)=1.5;
            cellp{PCount,8}=str{3,1};
            elseif h==4
            p(PCount,8)=3;
            cellp{PCount,8}=str{4,1};
            disp(p)
            end
            
end         
            
            
function Orient_Callback(handles, hObject, eventdata)
       h = handles.Value;
       str = Orient.String;
            if h==1 ;
            p(PCount,9)=1.5;
            cellp{PCount,9}=str{1,1};
            elseif h==2
            p(PCount,9)=1;
            cellp{PCount,9}=str{2,1};
            elseif h==3
            p(PCount,9)=1.5;
            cellp{PCount,9}=str{3,1};
            elseif h==4
            p(PCount,9)=3;
            cellp{PCount,9}=str{4,1};
            disp(p)
            end

end

function HanDif_Callback(handles, hObject, eventdata)
     
       h = handles.Value;
       str = HanDif.String;
            if h==1 ;
            p(PCount,10)=0.4;
            cellp{PCount,10}=str{1,1};
            elseif h==2
            p(PCount,10)=0.6;
            cellp{PCount,10}=str{2,1};
            elseif h==3
            p(PCount,10)=0.5;
            cellp{PCount,10}=str{3,1};
            elseif h==4
            p(PCount,10)=0.8;
            cellp{PCount,10}=str{4,1};
            elseif h==5
            p(PCount,10)=0.7;
            cellp{PCount,10}=str{5,1};
            elseif h==6
            p(PCount,10)=0.3;
            cellp{PCount,10}=str{6,1};
            elseif h==7
            p(PCount,10)=0.5;
            cellp{PCount,10}=str{7,1};
            elseif h==8
            p(PCount,10)=0.2;
            cellp{PCount,10}=str{8,1};
            elseif h==9
            p(PCount,10)=0;
            cellp{PCount,10}=str{9,1};
            disp(p)
            end

end

function RotOri_Callback(handles, hObject, eventdata)
     
       h = handles.Value;
       str = RotOri.String;
            if h==1 ;
            p(PCount,11)=0;
            cellp{PCount,11}=str{1,1};
            elseif h==2
            p(PCount,11)=0.2;
            cellp{PCount,11}=str{2,1};
            elseif h==3
            p(PCount,11)=0.4;
            cellp{PCount,11}=str{3,1};
            disp(p)
            end

end



% CB Cost Listbox

function ShapFac_Callback(handles, hObject, eventdata)
A = cell(1,5);  
A{1,1} = 'A1 - Basic';                                                           
A{1,2}= 'A2 - Regular';  
A{1,3}= 'A3 - Internal';
A{1,4}= 'A4 - Internal and External';
A{1,5}= 'A5 - Irregular and Complex';
cyl = sprintf('%s\n%s\n%s\n%s\n%s',A{1,1},A{1,2},A{1,3},A{1,4},A{1,5});
B{1,1} = 'B1 - Basic';                                                           
B{1,2}= 'B2 - Regular';  
B{1,3}= 'B3 - Orthogonal or Straight';
B{1,4}= 'B4 - Simple Curved';
B{1,5}= 'B5 - Irregular aor Countoured'; 
pri = sprintf('%s\n%s\n%s\n%s\n%s',B{1,1},B{1,2},B{1,3},B{1,4},B{1,5});
C{1,1} = 'C1 - Basic';                                                           
C{1,2}= 'C2 - Uniform Thickness';  
C{1,3}= 'C3 - Non-uniform section';
C{1,4}= 'C4 - Cup/Cone/Box';
C{1,5}= 'C5 - non-uniform Countoured'; 
fla = sprintf('%s\n%s\n%s\n%s\n%s',C{1,1},C{1,2},C{1,3},C{1,4},C{1,5});
       h = handles.Value;
       str = ShapFac.String;
            if h==1 ;
            GeoFeat.String = cyl; 
            p(PCount,12)=1;
            cellp{PCount,12}=str{1,1};
            elseif h==2
            GeoFeat.String = pri;
            p(PCount,12)=2;
            cellp{PCount,12}=str{2,1};
            elseif h==3
            GeoFeat.String = fla;
            p(PCount,12)=3;
            cellp{PCount,12}=str{3,1};
            disp(p)
            end

end


function GeoFeat_Callback(handles, hObject, eventdata)
       h = handles.Value;
       str = GeoFeat.String;
            if h==1 ;
            p(PCount,13)=1;
            cellp{PCount,13}=str{1,1};
            elseif h==2
            p(PCount,13)=2;
            cellp{PCount,13}=str{2,1};
            elseif h==3
            p(PCount,13)=3;
            cellp{PCount,13}=str{3,1};
            elseif h==4
            p(PCount,13)=4;
            cellp{PCount,13}=str{4,1};
            elseif h==5
            p(PCount,13)=5;
            cellp{PCount,13}=str{5,1};
            disp(p)
            end

end

function Mat_Callback(handles, hObject, eventdata)
       h = handles.Value;
       str = Mat.String;
            if h==1 ;
            p(PCount,14)=1;
            cellp{PCount,14}=str{1,1};
            elseif h==2
            p(PCount,14)=2;
            cellp{PCount,14}=str{2,1};
            elseif h==3
            p(PCount,14)=3;
            cellp{PCount,14}=str{3,1};
            elseif h==4
            p(PCount,14)=4;
            cellp{PCount,14}=str{4,1};
            elseif h==5
            p(PCount,14)=5;
            cellp{PCount,14}=str{5,1};
            elseif h==6
            p(PCount,14)=6;
            cellp{PCount,14}=str{6,1};
            elseif h==7
            p(PCount,14)=7;
            cellp{PCount,14}=str{7,1};
            elseif h==8
            p(PCount,14)=8;
            cellp{PCount,14}=str{8,1};
            elseif h==9
            p(PCount,14)=9;
            cellp{PCount,14}=str{9,1};
            elseif h==10
            p(PCount,14)=10;
            cellp{PCount,14}=str{10,1};
            elseif h==11
            p(PCount,14)=11;
            cellp{PCount,14}=str{11,1};
            disp(p)
            end

end

function PrimPro_Callback(handles, hObject, eventdata)
       h = handles.Value;
       str = PrimPro.String;
            if h==1 ;
            p(PCount,15)=1;
            cellp{PCount,15}=str{1,1};
            elseif h==2
            p(PCount,15)=2;
            cellp{PCount,15}=str{2,1};
            elseif h==3
            p(PCount,15)=3;
            cellp{PCount,15}=str{3,1};
            elseif h==4
            p(PCount,15)=4;
            cellp{PCount,15}=str{4,1};
            elseif h==5
            p(PCount,15)=5;
            cellp{PCount,15}=str{5,1};
            elseif h==6
            p(PCount,15)=6;
            cellp{PCount,15}=str{6,1};
            elseif h==7
            p(PCount,15)=7;
            cellp{PCount,15}=str{7,1};
            elseif h==8
            p(PCount,15)=8;
            cellp{PCount,15}=str{8,1};
            disp(p)
            end

end

function Esse_Callback(handles, hObject, eventdata)
       h = handles.Value;
       str = Esse.String;
            if h==1 ;
            p(PCount,20)=1;
            cellp{PCount,20}=str{1,1};
            elseif h==2
            p(PCount,20)=0;
            cellp{PCount,20}=str{2,1};
            disp(p)
            end

end


% Edit Boxes 

function NamePartEdit_Callback(hObject, eventdata, handles)

namestr = get(hObject,'String');
cellp{PCount,1} = namestr
end


function NumPartEdit_Callback(hObject, eventdata, handles)
input = get(hObject,'String');
rows = str2num(input)

end


function VolEdit_Callback(hObject, eventdata, handles)
v = get(hObject,'String');
p(PCount,16) = str2num(v) 
end

function QuantEdit_Callback(hObject, eventdata, handles)
v = get(hObject,'String');
p(PCount,17) = str2num(v) 
end



function limSecEdit_Callback(hObject, eventdata, handles)
v = get(hObject,'String');
p(PCount,18) = str2num(v) 
end

function TolEdit_Callback(hObject, eventdata, handles)
v = get(hObject,'String');
p(PCount,19) = str2num(v) 

end


function PlanEdit_Callback(hObject, eventdata, handles)
v = get(hObject,'String');
p(PCount,22) = str2num(v) 

end

%% Tab 2
% Table 1 
RawData = uitable(tab2,'Data',p,'Position',[20 420 1200 150]);
RawData.ColumnName = {'Part Number', 'Placing and Feeding','Process and Direction','No. Insertions ','Access/Vision','Alignment','Size & Weight','Orientation','Handling Difficulties','Rotational Orientation','Shape Factor','Features','Material','Primary manufacture','Mass','Volume','Limmit Section','Essential','reserved','reserved'};

RawDat.Stat = uicontrol(tab2,'Style','text',...
                'String','Numerical Data',...
                'Position',[20 570 60 13]);
            
Information.Stat = uicontrol(tab2,'Style','text',...
                'String','Part Information',...
                'Position',[20 400 60 13]);
DFAOut.Stat = uicontrol(tab2,'Style','text',...
                'String','DFA Indices',...
                'Position',[20 210 60 13]);
          
newdat = uitable(tab2, 'Data', cellp,'Position',[20 250 1200 150])     
newdat.ColumnName = {'Part Name', 'Placing and Feeding','Process and Direction','No. Insertions ','Access/Vision','Alignment','Size & Weight','Orientation','Handling Difficulties','Rotational Orientation','Shape Factor','Features','Material','Primary manufacture','Mass','Volume','Limmit Section','Essential','reserved','reserved'}; 


DFAdat = uitable(tab2, 'Data', cellp,'Position',[20 100 1200 150])     
DFAdat.ColumnName = {'Part Name', 'Fitting Index','Feeding Index','Cost Index','Manu Cost ind (Mi)','Complexity Factor (Cc)','Material Factor (Cmp)','Min Sec (Cs)','Tol Fact (Ct)','Processing Cost (Pc)','Material Cost','Vol (mm3)',' Waste Coeff (Wc)'};
% Update Data Button 

UpdateData.But = uicontrol(tab2,'Style','pushbutton','String','UpdateData',...
                'Position',[1000 20 100 40],...
                'Callback', @UpdateData_Callback);
            
            


                

            
 % Table 2 
            
function UpdateData_Callback(hObject, eventdata, handles)
disp(p)
disp(cellp)
RawData.Data = p
newdat.Data = cellp
end           
 
 
 % Save to xlsx Button 
 SaveXlsx.But = uicontrol(tab2,'Style','pushbutton','String','Save to xlsx file',...
                'Position',[20 20 100 40],...
                'Callback', @SaveXlsx_Callback);
            
function SaveXlsx_Callback(hObject, eventdata, handles)
clc
end 
            
 


    
end
