function O=medianFiltRenkli(I,N)

[sat,sut,r]=size(I);
O=zeros(sat,sut,r,'uint8');
%N=3; %3x3 median filtre

m=round(N*N/2); %median deðerlerin okunacak indis
k=round((N-1)/2);
P=zeros(N,N);
for x=(1+k):(sat-k)
    for y=(1+k):(sut-k)
        
        PR=I([(x-k):(x+k)],[(y-k):(y+k)],1); %Red
        PG=I([(x-k):(x+k)],[(y-k):(y+k)],2); %Green
        PB=I([(x-k):(x+k)],[(y-k):(y+k)],3); %Blue
        
        O(x,y,1)=median(PR(:));
        O(x,y,2)=median(PG(:));
        O(x,y,3)=median(PB(:));
    end
end
end
        