I=imread('C:\Users\Veys\Desktop\veyss.jpg');
Inoise=imnoise(I,'gaussian',0,0.01);


%median filtre ile fitrele
N=3;
O=medianFiltRenkli(Inoise,N);
figure(1);imshow(I);
figure(2);imshow(Inoise);
figure(3);imshow(O);