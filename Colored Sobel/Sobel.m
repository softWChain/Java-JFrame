%%
################
%%@author veysel
################

%%

clear all;
I=imread('rice.png');
[sat,sut]=size(I);
O=zeros(sat,sut,'uint8');

I=medfilt2(I,[5,5]);
H=[1,2,1;   
   0,0,0;
  -1,-2,-1];

V=[-1, 0, 1;
   -2, 0, 2;
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
figure(1),imshow(O)

%%
x=1; %üst satir
for y=2:(sat-1)
    
        R=double(I((x):(x+2),(y-1):(y+1)));
        Gx=sum(sum(H.*R)); %yatay
        Gy=sum(sum(V.*R)); %dikey
        
        g=sqrt((Gx*Gx)+(Gy*Gy));
        
        O(x,y)=uint8(g);
end

%%
x=sat;  %alt satir
for y=2:(sat-1)
    
    R=double(I((x-255):(x-253),(y-1):(y+1)));
    Gx=sum(sum(H.*R)); %yatay
    Gy=sum(sum(V.*R)); %dikey
        
    g=sqrt((Gx*Gx)+(Gy*Gy));
        
    O(x,y)=uint8(g);
end
%%
y=1; %sol sütün
for x=2:(sut-1)
    
    R=double(I((x-1):(x+1),(y):(y+2)));
    Gx=sum(sum(H.*R)); %yatay
    Gy=sum(sum(V.*R)); %dikey
        
    g=sqrt((Gx*Gx)+(Gy*Gy));
        
    O(x,y)=uint8(g);
end
%%
y=sut; %sað sütün
for x=2:(sut-1)
    
    R=double(I((x-1):(x+1),(y-255):(y-253)));
    Gx=sum(sum(H.*R)); %yatay
    Gy=sum(sum(V.*R)); %dikey
        
    g=sqrt((Gx*Gx)+(Gy*Gy));
        
    O(x,y)=uint8(g);
end

x=1,y=1; %ilk kare 

 R=double(I((x):(x+2),(y):(y+2)));
    Gx=sum(sum(H.*R)); %yatay
    Gy=sum(sum(V.*R)); %dikey
        
    g=sqrt((Gx*Gx)+(Gy*Gy));
        
    O(x,y)=uint8(g);
    
 x=sat,y=1; %ikinci kare 

 R=double(I((x-255):(x-253),(y):(y+2)));
    Gx=sum(sum(H.*R)); %yatay
    Gy=sum(sum(V.*R)); %dikey
        
    g=sqrt((Gx*Gx)+(Gy*Gy));
        
    O(x,y)=uint8(g);



figure(2),imshow(O)
%%