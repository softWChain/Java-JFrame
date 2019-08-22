clc
clear all
close all


%%
veys= imread('veysel.jpg');
[sat,sut]=size(veys);
O=zeros(sat,sut,'uint8');

%%
%%
figure;imshow(veys);
% veys=rgb2gray(veys); 
% figure;imshow(veys);
% seviye=graythresh(veys);

                          % threshold
bw_veys= im2bw(veys);     % im2bw fonksiyonu e�ik de�erine g�re resmi beyaz(1) ile siyah(0) olarak yeniden �izer.
                          
figure, imshow(bw_veys);
%%
%%
hor_threshold = sum(bw_veys,2);              %sum(bw_veys,2) komutu buradaki 2 de�eri yatay olarak toplamaya yar�yor.
alan = bw_veys;                              % A=[1,2,3;4,5,6;7,8,9]; �eklindeki matrisi 6 15 24 olarak toplar ama alt alta yazar.
horizontal_bulma = find(hor_threshold>=100); % Find komutu indeksi '0'  olmayan yani, pikseldeki de�er 
alan(horizontal_bulma,:) = 0;                % Resmin 100 de�erin  alt�ndaki pikseller s�f�rlan�yor 
figure,imshow(alan);                         % '0' de�ilse e�er o de�eri al�r '0' ise e�er o de�eri almaz.
%%

%%
ver_threshold = sum(alan,1);
vertical_bulma = find(ver_threshold<6);  % Burada yine horizontal'da yapt���m�z i�lemleri vertical i�in yap�yoruz.
alan(:,vertical_bulma) = 0;
figure, imshow(alan);
%%

                                         % MORFOLOJIK ��LEM
                                 
                            
morphol_veys = bwmorph(alan,'dilate'); %�kili resimlerde (lojik) morfolojik i�lemlere olanak sa�layan komuttur 
                                       %Buradaki dilate geni�letme yapar                                       
etiket_veys  = bwlabel(morphol_veys,4); %' bwlabel ' fonksiyonu kullanarak ka� tane cisim oldu�unu ve bu cizimlerin bir dizisini d�nd�r�r.
tot_etiket   = max(max(etiket_veys)); % Etiket de�erindeki max de�eri al�yor. 

alan = zeros(size(morphol_veys,1),size(morphol_veys,2)); % morphol_veys piksel boyutu kadar zeros alan� olu�turma
% alan2 = zeros(size(morphol_veys,1),size(morphol_veys,2)); % morphol_veys piksel boyutu kadar zeros alan� olu�turma

for i = 1:tot_etiket 
    [r c] = find(etiket_veys==i);
    toplam = length(r);
    if toplam>1000
        for j = 1:length(r)
            alan(r(j),c(j)) = 1;
        end
        
    end
end
figure, imshow(alan);
%%

hor_threshold1 = sum(alan,1);
bulma = find(hor_threshold1~=2);
hor_basla = bulma(1);
hor_bit = bulma(end);
%%

ver_threshold1 = sum(alan,2);
bulma = find(ver_threshold1~=0);
ver_basla = bulma(1);
ver_bit = bulma(end);

figure;imshow(alan);
%%
%%
% Plaka ��karma...

plaka_algila1 = bw_veys(ver_basla+8:ver_bit-3,hor_basla+150:hor_bit-230);
plaka_algila2 = bw_veys(ver_basla+8:ver_bit-3,hor_basla+162:hor_bit-215);
plaka_algila3 = bw_veys(ver_basla+8:ver_bit-3,hor_basla+185:hor_bit-190);
plaka_algila4 = bw_veys(ver_basla+8:ver_bit-3,hor_basla+201:hor_bit-177);
plaka_algila5 = bw_veys(ver_basla+8:ver_bit-3,hor_basla+220:hor_bit-163);
plaka_algila6 = bw_veys(ver_basla+8:ver_bit-3,hor_basla+230:hor_bit-150);
plaka_algila7 = bw_veys(ver_basla+6:ver_bit-4,hor_basla+243:hor_bit-138);
plaka_algila8 = bw_veys(ver_basla+6:ver_bit-4,hor_basla+254:hor_bit-128);

subplot(8,8,1),imshow(plaka_algila1);
subplot(8,8,2),imshow(plaka_algila2);
subplot(8,8,3),imshow(plaka_algila3);
subplot(8,8,4),imshow(plaka_algila4);
subplot(8,8,5),imshow(plaka_algila5);
subplot(8,8,6),imshow(plaka_algila6);
subplot(8,8,7),imshow(plaka_algila7);
subplot(8,8,8),imshow(plaka_algila8);


%%
 
 













