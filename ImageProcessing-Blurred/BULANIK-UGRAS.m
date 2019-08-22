I=double( imread('rice.png') );
[sat, sut]=size(I);

O=zeros(sat, sut, 'uint8');

W=[1/9 1/9 1/9;
    1/9 1/9 1/9;
    1/9 1/9 1/9];

y=128,x=128
for x=2:sat-1
    O(x,y)=uint8(...
        W(1,1)*I(x-1,y-1) +W(1,2)*I(x-1,y) +W(1,3)*I(x-1,y+1)...
        +W(2,1)*I(x,y-1) +W(2,2)*I(x ,y) +W(2,3)*I(x,y+1)...
        +W(3,1)*I(x+1,y-1) +W(3,2)*I(x+1,y) +W(3,3)*I(x+1,y+1) );
    
end

y=128,x=128
for y=2:sut-1
    O(x,y)=uint8(...
        W(1,1)*I(x-1,y-1) +W(1,2)*I(x-1,y) +W(1,3)*I(x-1,y+1)...
        +W(2,1)*I(x,y-1) +W(2,2)*I(x ,y) +W(2,3)*I(x,y+1)...
        +W(3,1)*I(x+1,y-1) +W(3,2)*I(x+1,y) +W(3,3)*I(x+1,y+1) );
    
end

x=128
for x=2:sat-1
    for y=2:sut-1
        if(y==x)
            O(x,y)=uint8(...
        W(1,1)*I(x-1,y-1) +W(1,2)*I(x-1,y) +W(1,3)*I(x-1,y+1)...
        +W(2,1)*I(x,y-1) +W(2,2)*I(x ,y) +W(2,3)*I(x,y+1)...
        +W(3,1)*I(x+1,y-1) +W(3,2)*I(x+1,y) +W(3,3)*I(x+1,y+1) );
        end
    end

end

x=256
for x=2:sat-1
    for y=2:sut-1
        if(x+y==sat)
            O(x,y)=uint8(...
        W(1,1)*I(x-1,y-1) +W(1,2)*I(x-1,y) +W(1,3)*I(x-1,y+1)...
        +W(2,1)*I(x,y-1) +W(2,2)*I(x ,y) +W(2,3)*I(x,y+1)...
        +W(3,1)*I(x+1,y-1) +W(3,2)*I(x+1,y) +W(3,3)*I(x+1,y+1) );
        end
    end

end





    
imshow(O);
    
    