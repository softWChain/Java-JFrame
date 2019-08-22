I=imread('rice.png');
[sat,sut,r]=size(I);
O=zeros(sat,sut,'uint8');
N=3; %3x3 median filter

k=round((N-1)/2);
P=zeros(3,3);
for x=(1+k):(sat-k)
    for y=(1+k):(sut-k)
        %
        P=I([(x-1):(x+1)],[(y-1):(y+1)]);
        %
        O(x,y)=median(P(:));
    end
end

x=1
    for y=(1+k):(sut-k)
        %
        P=I([(x):(x+1)],[(y):(y+1)]);    
        %
        O(x,y)=median(P(:));
    end
%  x=256
%     for y=(1+k):(sut-k)
%         %
%         P=I([(x-1):(x)],[(y):(y+1)]);  %P=I([(y-1):(y)],[(x):(x+1)]); 
%         %
%         O(x,y)=median(P(:));
%     end
% end
% % 
% % 
% for y=1
%     for x=(1+k):(sat-k)
%         %
%         P=I([(x):(x+1)],[(y):(y+1)]);
%         %
%         O(x,y)=median(P(:));
%     end
% end
% 
%  y=256
%     for x=(1+k):(sat-k)
%         %
%         P=I([(y-1):(y)],[(x):(x+1)]); %P=I([(x-1):(x)],[(y):(y+1)]);
%         %
%         O(x,y)=median(P(:));
%     end
%  x=1,y=1;
%  
% for x=(1+k):(sat-k)
%     for y=(1+k):(sut-k)
%         P=I([(x-1):(x)],[(y):(y+1)]);
%         %
%         O(x,y)=median(P(:));
%     end
% end
% 
% x=1,y=1;
% 
% P=I([(x):(x+1)],[(y):(y+1)]);
%         %
% O(x,y)=median(P(:));
% 
% x=sat,y=1;
% 
% P=I([(x):(x)],[(y):(y+1)]);
%         %
% O(x,y)=median(P(:));
% 
% x=1,y=sat;
% 
% P=I([(x):(x+1)],[(y):(y)]);
%         %
% O(x,y)=median(P(:));
% 
% x=sat,y=sut;
% 
% P=I([(x):(x)],[(y):(y)]);
%         %
% O(x,y)=median(P(:));



figure(1);imshow(I)
figure(2);imshow(O)