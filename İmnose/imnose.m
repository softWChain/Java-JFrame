I=imread('rice.jpg');
[sat,sut]=size(I);
I=imnoise(I,'salt & pepper');
O=zeros(sat,sut,'uint8');
N=5;
k=(N-1)/2;

for x=(1+k):(sat-k)
    for y=(1+k):(sut-k)
        
        P=I((x-k):(x+k),(y-k):(y+k)); %3x3 penceresi
        V=P(:);
        S=sort(V);
        O(x,y)=V(13); %dizinin ortasýndaji elemani aalir
        
    end
end
subplot(121),imshow(I);
subplot(122),imshow(O);