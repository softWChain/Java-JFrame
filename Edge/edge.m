
veys= imread('C:\Users\Veys\Desktop\veyss12.jpg');
[sat,sut]=size(veys);
O=zeros(sat,sut,'uint8');

H=[1,2,1;   
   0,0,0;
  -1,-2,-1];

V=[-1, 0, 1;
   -2, 0, 2;
   -1,0 ,1];

for x=2:(sat-1)
    for y=2:(sut-1)
        
        R=double(veys((x-1):(x+1),(y-1):(y+1)));
        Gx=sum(sum(H.*R)); %yatay
        Gy=sum(sum(V.*R)); %dikey
        
        g=sqrt((Gx*Gx)+(Gy*Gy));
        
        O(x,y)=uint8(g);
    end
end
bw_veys= im2bw(veys);

R=double(veys((x-1):(x+1),(y-1):(y+1)));
hor_threshold =sum(sum(H.*R));
alan = bw_veys;
horizontal_bulma = find(hor_threshold<=100); % Find komutu indeksi '0'  olmayan yani, pikseldeki deðer 
alan(horizontal_bulma,:) = 0;                % '0' deðilse eðer o deðeri alýr '0' ise eðer o deðeri almaz.
figure,imshow(alan);
%%

%%
R=double(veys((x-1):(x+1),(y-1):(y+1)));
ver_threshold = sum(sum(V.*R))*(50);
vertical_bulma = find(ver_threshold<190);  % Burada yine horizontal'da yaptýðýmýz iþlemleri vertical için yapýyoruz.
alan(:,vertical_bulma) = 0;
figure, imshow(alan);

% figure,imshow(veys)
% figure,imshow(O)
% figure, imshow(bw_veys);
 