clear all

%LPC (linear predictive coding) feature
for i11 = 1:97 %total number of audio file
    disp(i11);
    filename11 = sprintf('s10501%d.wav',i11); 
    [s11,fs11]= audioread(filename11); 
  t11 = [240 400 0];   % sampling frequency was 16kHz, frame size was 25ms. Hence no of samples were 400. Overlapping 40%
p11=13;
c11 = lpcauto(s11,p11,t11);
v11 = c11';
k11 = 1; % no of centroids required
r11 = vqlbg(v11,k11);
lpc1(:,i11) = r11(2:14);
end
 %calculate entropy
for i12 = 1:97 %total number of audio file
    disp(i12)
    filename12 = sprintf('s10501%d.wav',i12); 
 
   
    c12 =mirentropy(filename12); 
   
    mirgetdata(c12); 
 entropy1(:,i12)=ans; 
end
%calculate plp (perceptual linear prediction)
for i13= 1:97 %total number of audio file
    disp(i13)
    filename13 = sprintf('s10501%d.wav',i13); 
    [s13,fs13]= audioread(filename13); 

[cepp13, specp13] = rastaplp(s13, fs13, 0, 12);
plp1(:,i13) = mean (cepp13,2);
end
%calculate rms (root mean square )
for i14 = 1:97
    disp(i14)
    filename14 = sprintf('s10501%d.wav',i14); 
    [signal1,fs1]= audioread(filename14); 
  
    c14 =mirrms(filename14); 
 
    mirgetdata(c14); 
rms1(:,i14)=ans; 
end
%calculate mfcc 
for i15 = 1:97
    disp(i15)
    filename15 = sprintf('s10501%d.wav',i15); 
    [signal1,fs1]= audioread(filename15); 

   
    c15 =mirmfcc(filename15); 

    mirgetdata(c15); 
mfcc1(:,i15)=ans; 
end
%calculate centroid
for i16 = 1:97
    disp(i16)
    filename16 = sprintf('s10501%d.wav',i16); 
    [signal1,fs1]= audioread(filename16); 

    c16 =mircentroid(filename16); 
 
    mirgetdata(c16); 
  centroid1 (:,i16)=ans; 
end