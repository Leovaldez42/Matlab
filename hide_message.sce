  
function cacher_message(image,message)

disp("Entering image: ")
im1=imread(valdez.jpg);

n=size(im1);

x=double(zeros(n));//hypermatrix to image size
im1=uint8(im1);

x=floor(im1/16)*16 ;//set lsb to 0

txt=ascii(message);
tt=length(txt);//message size
//disp(dec2bin(bitcmp(tt,8)));
//disp(txt);

[li,col]=size(im1);
nbpx=li * col;//number of pixels

count=1;

//as long as message <= number of pixels available
if tt <= nbpx then

       for i=1:li
            for j=1:col
                    
                    //hide the number of characters in the 1st pixel
                    if (i == 1) & (j == 1) then
                        x(i,j,2) = x(i,j,2) + uint8(floor(tt/16));//msb
                        k2 = uint8(floor(tt*16));//lsb
                        x(i,j,3) = x(i,j,3) + (k2/16);//tt hide on 16 bits
                        //j=j+1;
                    
                    
                    //hide the characters in the following pixels
                    elseif count <= tt then
                        x(i,j,2) = x(i,j,2) + floor(txt(count)/16);
                        k2 = uint8(floor(txt(count)*16));
                        x(i,j,3) = x(i,j,3) + (k2/16);
                        count=count+1;
                    
                    else break    
                    end
        end
    end
else disp('Message too long');
end

y=uint8(x);

imwrite(y,'valdez.png');//write picture + message

endfunction
