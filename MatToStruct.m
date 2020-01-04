
% matrix to structure
function part = MatToStruct(rows, p)
    load('bigmatrix.mat','p')
    i=1;
    for i = 1:rows;
    
   Part(i).number = p(i,1);
   part(i).placing = p(i,2);
   part(i).direction = p(i,3);
   part(i).insertion = p(i,4);
   part(i).acess = p(i,5);
   part(i).alignment = p(i,6);
   part(i).insertion = p(i,7);
   part(i).size = p(i,8);
   part(i).orientation = p(i,9);
   part(i).handling = p(i,10);
   part(i).rotational = p(i,11);
   part(i).Shape = p(i,12);
   part(i).geometry = p(i,13);
   part(i).material = p(i,14);
   part(i).manufacturing = p(i,15);
   part(i).essential = p(i,16);
   part(i).Vol = p(i,17);
   part(i).quantity = p(i,18);
   part(i).section = p(i,19);
   part(i).tolerance = p(i,20);
   part(i).Planes = p(i,21);
  
   
   
 
    end 
    table1 = struct2table(part)
end


