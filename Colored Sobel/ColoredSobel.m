
clc
clear all;
I=imread('C:\Users\Veys\Desktop/3113.jpg');   
[sat,sut,r]=size(I);
O=zeros(sat,sut,'uint8');
% I=medfilt2(I,[5,5]);

H=[1,2,1;
   0,0,0;
  -1,-2,-1];

V=[-1, 0, 1;
   -2, 0, 2;
   -1,0 ,1];

for z=1:3
for x=2:(sat-1)
    for y=2:(sut-1)
        
        R=double(I((x-1):(x+1),(y-1):(y+1),z));
        
        Gx=sum(sum(H.*R));
        Gy=sum(sum(V.*R));
        
        g=sqrt((Gx*Gx)+(Gy*Gy));
        
        O(x,y,z)=uint8(g);
    end
end
end


imshow(O);
        
        