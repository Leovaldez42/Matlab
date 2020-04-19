function find_message(image2)
    
im2=imread(image2);

[ligne,colonne]=size(im2);

count2=0;

for o=1:ligne
    for p=1:colonne

            //retrieve the size of the chain
            if o==1 & p==1 then
                k4=uint8(floor(im2(o,p,2)*16));// size msb
                k5=floor(im2(o,p,3)*16)/16;//// size lsb
                limite=k4+k5;// limit = number of characters in the message
                //p=p+1;
             //end
             
             // recover the characters of the message
            elseif count2 <= limite then 
                
                count2=count2+1;
                //store the characters in k6
                k4=uint8(floor(im2(o,p,2)*16));// k4 = character msb
                k5=floor(im2(o,p,3)*16)/16;//k5=character lsb
                k6(1,count2,1)=k4+k5;//k6 = character msb+lsb
            else break
            end
    end 
end 

// display our message
disp(ascii(k6));
    
endfunction
