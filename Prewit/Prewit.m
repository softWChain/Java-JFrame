clc
clear all;
I=imread('rice.png');
[sat,sut]=size(I);
O=zeros(sat,sut,'uint8');

I=medfilt2(I,[5,5]);

H=[-1, -1, -1;
   0, 0, 0;
   1,1 ,1];

V=[-1, 0, 1;  
   -1, 0, 1;
   -1,0 ,1];



for x=2:(sat-1)
    for y=2:(sut-1)
        
        R=double(I((x-1):(x+1),(y-1):(y+1)));
        Gx=sum(sum(H.*R)); %yatay
        Gy=sum(sum(V.*R)); %dikey
        
        g=sqrt((Gx*Gx)+(Gy*Gy));
        
        O(x,y)=uint8(g);
    end
end

imshow(O);
        