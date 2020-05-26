    load Training2
    load Classification2
    load Sample2
    load Actual2
    load B_prediction
    load Training3
    load Sample3
     load Classification3
     load Max1
     load Max2

    %%% Feature Selection %%%%
        [I_Cx, I_Cxx, I_xx, H_x, H_xx, H_C]=Fuzzy_MI(X2Copy);
       [fea] = mrmr_mid_d(X2Copy, Y3Copy, 14);

    
minimum1=zeros(1,13);
minimum1(:,[6,7,8,9,10,11,12,13])=min(X3(:,[6,7,8,9,10,11,12,13]));
minimum1(minimum1==0)=NaN;
range1=zeros(1,13);
range1(:,[6,7,8,9,10,11,12,13])=range(X3(:,[6,7,8,9,10,11,12,13]));
range1(range1==0)=NaN;

minimum2=zeros(1,13);
minimum2(:,[6,7,8,9,10,11,12,13])=min(Sample3(:,[6,7,8,9,10,11,12,13]));
minimum2(minimum2==0)=NaN;
range2=zeros(1,13);
range2(:,[6,7,8,9,10,11,12,13])=range(Sample3(:,[6,7,8,9,10,11,12,13]));
range2(range2==0)=NaN;

minimum3=zeros(1,13);
minimum3(:,[6,7,8,9,10,11,12,13])=min(B_prediction(:,[6,7,8,9,10,11,12,13]));
minimum3(minimum3==0)=NaN;
range3=zeros(1,13);
range3(:,[6,7,8,9,10,11,12,13])=range(B_prediction(:,[6,7,8,9,10,11,12,13]));
range3(range3==0)=NaN;

minimum4=zeros(1,13);
minimum4(:,[6,7,8,9,10,11,12,13])=min(Sample2(:,[6,7,8,9,10,11,12,13]));
minimum4(minimum4==0)=NaN;
range4=zeros(1,13);
range4(:,[6,7,8,9,10,11,12,13])=range(Sample2(:,[6,7,8,9,10,11,12,13]));
range4(range4==0)=NaN;

minimum1=[minimum2;minimum1];
minimum1=[minimum3;minimum1];
minimum1=[minimum4;minimum1];

Minimum=zeros(1,13);
Minimum(:,[6,7,8,9,10,11,12,13])=min(minimum1(:,[6,7,8,9,10,11,12,13]));
Minimum(Minimum==0)=NaN;

range1=[range2;range1];
range1=[range3;range1];
range1=[range4;range1];

Maxrange=zeros(1,13);
Maxrange(:,[6,7,8,9,10,11,12,13])=max(range1(:,[6,7,8,9,10,11,12,13]));
Maxrange(Maxrange==0)=NaN;

%%%%Biomechanical Normalisation%%%%
X4=zeros(1,13);
Sample3i=zeros(1,13);
B_prediction1=zeros(1,13);
Sample2i=zeros(1,13);
for i = 1:size(X3)
      X4(i,[6,7,8,9,10,11,12,13])=X3(i,[6,7,8,9,10,11,12,13])-Minimum(:,[6,7,8,9,10,11,12,13]);
 end
  for i = 1:size(Sample3)
     Sample3i(i,[6,7,8,9,10,11,12,13])=Sample3(i,[6,7,8,9,10,11,12,13])-Minimum(:,[6,7,8,9,10,11,12,13]);
  end
  for i = 1:size(B_prediction)
         B_prediction1(i,[6,7,8,9,10,11,12,13])=B_prediction(i,[6,7,8,9,10,11,12,13])-Minimum(:,[6,7,8,9,10,11,12,13]);
  end
  for i = 1:size(Sample2)
         Sample2i(i,[6,7,8,9,10,11,12,13])=Sample2(i,[6,7,8,9,10,11,12,13])-Minimum(:,[6,7,8,9,10,11,12,13]);
  end         

% X4(X4==0)=NaN;
% Sample3i(Sample3i==0)=NaN;
% B_prediction1(B_prediction1==0)=NaN;
% Sample2i(Sample2i==0)=NaN;

for i = 1:size(X4)
X4(i,[6,7,8,9,10,11,12,13])=X4(i,[6,7,8,9,10,11,12,13])./Maxrange(:,[6,7,8,9,10,11,12,13]);
 X4(i,[6,7,8,9,10,11,12,13])=X4(i,[6,7,8,9,10,11,12,13])*100;
end
for i = 1:size(Sample3i)
    Sample3i(i,[6,7,8,9,10,11,12,13])=Sample3i(i,[6,7,8,9,10,11,12,13])./Maxrange(:,[6,7,8,9,10,11,12,13]);
    Sample3i(i,[6,7,8,9,10,11,12,13])=Sample3i(i,[6,7,8,9,10,11,12,13])*100;
end
    for i = 1:size(B_prediction1)
    B_prediction1(i,[6,7,8,9,10,11,12,13])=B_prediction1(i,[6,7,8,9,10,11,12,13])./Maxrange(:,[6,7,8,9,10,11,12,13]);
    B_prediction1(i,[6,7,8,9,10,11,12,13])=B_prediction1(i,[6,7,8,9,10,11,12,13])*100;
   end
    for i = 1:size(Sample2i)
    Sample2i(i,[6,7,8,9,10,11,12,13])=Sample2i(i,[6,7,8,9,10,11,12,13])./Maxrange(:,[6,7,8,9,10,11,12,13]);
    Sample2i(i,[6,7,8,9,10,11,12,13])=Sample2i(i,[6,7,8,9,10,11,12,13])*100;
    end

    X3(:,[6,7,8,9,10,11,12,13])=X4(:,[6,7,8,9,10,11,12,13]);
    Sample3(:,[6,7,8,9,10,11,12,13])= Sample3i(:,[6,7,8,9,10,11,12,13]);
    B_prediction(:,[6,7,8,9,10,11,12,13])= B_prediction1(:,[6,7,8,9,10,11,12,13]);
    Sample2(:,[6,7,8,9,10,11,12,13])=Sample2i(:,[6,7,8,9,10,11,12,13]);
    
    



    %   %Best K for leeast error%

   mdl1=ClassificationKNN.fit(X3(:,[1,2,3,4,5]),Y3,'NumNeighbors',10);
    mdl2=ClassificationKNN.fit(X3(:,5),Y3,'NumNeighbors',5);
   mdl3=ClassificationKNN.fit(X3(:,2),Y3,'NumNeighbors',17);
   mdl4=ClassificationKNN.fit(X3(:,3),Y3,'NumNeighbors',7);  
   mdl5=ClassificationKNN.fit(X3(:,4),Y3,'NumNeighbors',9);
    mdl6=ClassificationKNN.fit(X3(:,1),Y3,'NumNeighbors',3);  
  mdl7=ClassificationKNN.fit(X3(:,7),Y3,'NumNeighbors',11); 
  mdl8=ClassificationKNN.fit(X3(:,6),Y3,'NumNeighbors',3);   
  mdl9=ClassificationKNN.fit(X3(:,8),Y3,'NumNeighbors',20);  
  mdl10=ClassificationKNN.fit(X3(:,9),Y3,'NumNeighbors',16);
   mdl11=ClassificationKNN.fit(X3(:,10),Y3,'NumNeighbors',13); 
   mdl12=ClassificationKNN.fit(X3(:,11),Y3,'NumNeighbors',3); 
   mdl13=ClassificationKNN.fit(X3(:,12),Y3,'NumNeighbors',2); 
  mdl14=ClassificationKNN.fit(X3(:,13),Y3,'NumNeighbors',6); 
     mdl15=ClassificationKNN.fit(X3(:,[6,7,9,10,11,12,13]),Y3,'NumNeighbors',3);
      mdl16=ClassificationKNN.fit(X3(:,[1,2,3,4,5,6,7,9,10,11,12,13]),Y3,'NumNeighbors',4);
     
%       mdl17=ClassificationKNN.fit(X3(:,[5,7]),Y3,'NumNeighbors',12);
      mdl17=ClassificationKNN.fit(X3(:,[5,6,7,9,10,11,12,13]),Y3,'NumNeighbors',7);
 
%  %Resubstitution loss fraction of misclassification from predictions of mdl% 
%    allrloss=resubLoss(mdl1);
%     QOLrloss=resubLoss(mdl2);
%    symptomrloss=resubLoss(mdl3);
%    ADLrloss=resubLoss(mdl4);
%    SRrloss=resubLoss(mdl5);
%    painrloss=resubLoss(mdl6);
%   knee2rloss=resubLoss(mdl7);
%   knee1rloss=resubLoss(mdl8);
%   kneerangerloss=resubLoss(mdl9);
%     loadingrloss=resubLoss(mdl10);
%       hip20rloss=resubLoss(mdl11);
%       hip50rloss=resubLoss(mdl12);
%       hip501loss=resubLoss(mdl13);
%      knee20rloss=resubLoss(mdl14);
% 
%       biorloss=resubLoss(mdl15);
%         all3rloss=resubLoss(mdl16);
%            tworloss=resubLoss(mdl17);
  
%  %construct a cross-validated classifier from the model%
%    allcvmdl=crossval(mdl1);
%     QOLcvmdl=crossval(mdl2);
%    symptomcvmdl=crossval(mdl3);
%    ADLcvmdl=crossval(mdl4);
%    SRcvmdl=crossval(mdl5);
%    paincvmdl=crossval(mdl6);
%   knee2cvmdl=crossval(mdl7);
%   knee1cvmdl=crossval(mdl8);
%   kneerangecvmdl=crossval(mdl9);
%     loadingcvmdl=crossval(mdl10);
%      hip20cvmdl=crossval(mdl11);
%        hip50cvmdl=crossval(mdl12);
%          hip501cvmdl=crossval(mdl13);
%           knee20cvmdl=crossval(mdl14);
%            biocvmdl=crossval(mdl15);
%                     all3cvmdl=crossval(mdl16);
%                        twocvmdl=crossval(mdl17);

%  %Examine cross-validation loss when predicting data not used for
%  %training%
%    allkloss=kfoldLoss(allcvmdl);
%     QOLkloss=kfoldLoss(QOLcvmdl);
%    symptomkloss=kfoldLoss(symptomcvmdl);
%    ADLkloss=kfoldLoss(ADLcvmdl);
%    SRkloss=kfoldLoss(SRcvmdl);
%    painkloss=kfoldLoss(paincvmdl);
%   knee2kloss=kfoldLoss(knee2cvmdl);
%   knee1kloss=kfoldLoss(knee1cvmdl);
%   kneerangekloss=kfoldLoss(kneerangecvmdl);
%   loadingkloss=kfoldLoss(loadingcvmdl);
%   hip20kloss=kfoldLoss(hip20cvmdl);
%    hip50kloss=kfoldLoss(hip50cvmdl);
%    hip501kloss=kfoldLoss(hip501cvmdl);
%   knee20kloss=kfoldLoss(knee20cvmdl);
%  biokloss=kfoldLoss(biocvmdl);
%   all3kloss=kfoldLoss(all3cvmdl);
%      twokloss=kfoldLoss(twocvmdl);

  [alllabel2,allscore2,allcost2]=predict(mdl1,Sample3(:,[1,2,3,4,5]));
  all2=alllabel2;
 confusionall2=confusionmat(Actual2,all2);
 
 [QOLlabel2,QOLscore2,QOLcost2]=predict(mdl2,Sample3(:,5));
 QOL2=QOLlabel2;
 confusionQOL=confusionmat(Actual2,QOL2);
 
  [symptom2label,symptom2score,symptom2cost]=predict(mdl3,Sample3(:,2));
  symptom2=symptom2label;
 confusionsymptom=confusionmat(Actual2,symptom2);
 
 [ADLlabel2,ADLscore2,ADLcost2]=predict(mdl4,Sample3 (:,3));
 ADL=ADLlabel2;
 confusionADL=confusionmat(Actual2,ADL);
 
  [SRlabel2,SRscore2,SRcost2]=predict(mdl5,Sample3 (:,4));
 SR=SRlabel2;
 confusionSR=confusionmat(Actual2,SR);
 
  [painlabel2,painscore2,paincost2]=predict(mdl6,Sample3(:,1));
  Pain=painlabel2;
 confusionPain=confusionmat(Actual2,Pain);
 
 [knee2label2,knee2score2,knee2cost2]=predict(mdl7,Sample3(:,7));
 knee2=knee2label2;
 confusionknee2=confusionmat(Actual2,knee2);

 [kneelabel2,kneescore2,kneecost2]=predict(mdl8,Sample3(:,6));
 knee=kneelabel2;
 confusionknee=confusionmat(Actual2,knee);

 [kneerangelabel2,kneerangescore2,kneerangecost2]=predict(mdl9,Sample3(:,8));
 kneerange=kneerangelabel2;


 [loadinglabel2,loadingscore2,loadingcost2]=predict(mdl10,Sample3(:,9));
  loading=loadinglabel2;
  confusionhiploading=confusionmat(Actual2,loading);
  
  [hip20label2,hip20score2,hip20cost2]=predict(mdl11,Sample3(:,10));
   hip20=hip20label2;
   confusionhip20=confusionmat(Actual2,hip20);
  
  [hip50label2,hip50score2,hip50cost2]=predict(mdl12,Sample3(:,11));
   hip50=hip50label2;
   confusionhip50=confusionmat(Actual2,hip50);
  
   [hip501label2,hip501score2,hip501cost2]=predict(mdl13,Sample3(:,12));
   hip501=hip501label2;
   confusionhip501=confusionmat(Actual2,hip501);
  
  [knee202label,knee202score2,knee202cost2]=predict(mdl14,Sample3(:,13));
   knee20=knee202label;
   confusionknee20=confusionmat(Actual2,knee20);

 [biolabel2,bioscore2,biocost2]=predict(mdl15,Sample3(:,[6,7,9,10,11,12,13]));
   bio=biolabel2;
   confusionbio=confusionmat(Actual2,bio);
   
     [alllabel,allscore,allcost]=predict(mdl16,Sample3(:,[1,2,3,4,5,6,7,9,10,11,12,13]));
    all=alllabel;
    confusionall=confusionmat(Actual2,all);
    
         [twolabel,twoscore,twocost]=predict(mdl17,Sample3(:,[5,6,7,9,10,11,12,13]));
    two=twolabel;
    
%           [twolabel,twoscore,twocost]=predict(mdl2,Sample3(:,5));
%     two=twolabel;
%               [twolabel,twoscore,twocost]=predict(mdl15,Sample3(:,[6,7,9,10,11,12,13]));
%     two=twolabel;
    
   confusiontwo=confusionmat(Actual2,two);
   
     gscatter(Sample3(:,5),Sample3(:,7),two,'gk','+o');
     xmin = 0;
ymin = 0;
xmax =100;
ymax = 100;

axis([xmin,xmax,ymin,ymax])
          title('KNN Prediction Accuracy')
  xlabel('QOL')
  ylabel ('Internal knee abduction moment 2nd 50%')
  legend('Control (Prediction)','OA (prediction)','','');
  legend('location','best');
    hold on
%     pause 
%       gscatter(Sample3(:,5),Sample3(:,7),two,'rb','+o');
%   legend('A','C','A(knee)','C(knee)');
%   legend('location','best');
%     hold on
     pause    
    
      gscatter(Sample3(:,5),Sample3(:,7),Actual2,'rb','+o');
axis([xmin,xmax,ymin,ymax])
 legend('Control (Prediction)','OA (prediction)','Control','OA');
 legend('location','best');
 hold on
 pause
     
    close figure 1
    

for i= 1:size(all2);
   if all2{i}=='A';
         all2{i}=0;
       
        else all2{i}=='C';
                all2{i}=1;
   end
end
     for i= 1:size(all2);  
     if  QOL2{i}=='A';
            QOL2{i}=0;
     else      QOL2{i}=='C';
             QOL2{i}=1;
     end
     end
    for i= 1:size(all2);       
   if    symptom2{i}=='A';
       symptom2{i}=0;
   else  symptom2{i}=='C';
       symptom2{i}=1;
   end
    end
   for i= 1:size(all2);           
     if ADL{i}=='A';
      ADL{i}=0;
     else  ADL{i}=='C';
       ADL{i}=1;
     end
   end
   for i= 1:size(all2);    
      if SR{i}=='A';
       SR{i}=0;
      else SR{i}=='C';
           SR{i}=1;
      end
   end
    for i= 1:size(all2);   
     if  Pain{i}=='A';
       Pain{i}=0;
     else Pain{i}=='C';
         Pain{i}=1;
     end
    end
   for i= 1:size(all2);    
       if knee2{i}=='A';
         knee2{i}=0;
       else knee2{i}=='C';
         knee2{i}=1;
       end
   end
   for i= 1:size(all2);     
    if   knee{i}=='A';
        knee{i}=0;
    else  knee{i}=='C';
         knee{i}=1;
    end
   end
    for i= 1:size(all2);   
      if  kneerange{i}=='A';
         kneerange{i}=0;
      else  kneerange{i}=='C';
         kneerange{i}=1;
      end
    end
   for i= 1:size(all2);     
       if loading{i}=='A';
          loading{i}=0;
       else   loading{i}=='C';
                 loading{i}=1; 
       end
   end
for i= 1:size(all2); 
    if    hip20{i}=='A';
        hip20{i}=0;
    else  hip20{i}=='C';
            hip20{i}=1;
    end
end
for i= 1:size(all2);      
   if     hip50{i}=='A';
          hip50{i}=0;
   else      hip50{i}=='C';
                    hip50{i}=1;
   end
end
 for i= 1:size(all2);   
    if    hip501{i}=='A';
        hip501{i}=0;
    else    hip501{i}=='C';
               hip501{i}=1;
    end
 end
for i= 1:size(all2);
    if    knee20{i}=='A';
       knee20{i}=0;
    else   knee20{i}=='C';
               knee20{i}=1;
end
end
for i= 1:size(all2);
     if   bio{i}=='A';
         bio{i}=0;
     else   bio{i}=='C';
              bio{i}=1;
     end
end
for i= 1:size(all2);
   if     all{i}=='A';
         all{i}=0;
   else      all{i}=='C';
                all{i}=1;
   end
end

for i= 1:size(all2);
   if two{i}=='A';
         two{i}=0;
       
        else two{i}=='C';
                two{i}=1;
   end
end
     
       all22=all2;
       QOL22=QOL2;
       symptom22=symptom2;
       ADL2=ADL;
       SR2=SR;
       Pain2=Pain;
        knee202=knee;
       knee22=knee2;
       kneerange2=kneerange;
       loading2=loading;
       hip202=hip20;
       hip502=hip50;
       hip5012=hip501;
       knee201=knee20;
       bio2=bio;
       all20=all;
       two2=two;
       
  [alllabel2,allscore2,allcost2]=predict(mdl1,Sample3(:,[1,2,3,4,5]));
  all2=alllabel2;

 [QOLlabel2,QOLscore2,QOLcost2]=predict(mdl2,Sample3(:,5));
 QOL2=QOLlabel2;

  [symptom2label,symptom2score,symptom2cost]=predict(mdl3,Sample3(:,2));
  symptom2=symptom2label;

 [ADLlabel2,ADLscore2,ADLcost2]=predict(mdl4,Sample3 (:,3));
 ADL=ADLlabel2;

  [SRlabel2,SRscore2,SRcost2]=predict(mdl5,Sample3 (:,4));
 SR=SRlabel2;

  [painlabel2,painscore2,paincost2]=predict(mdl6,Sample3(:,1));
  Pain=painlabel2;

 [knee2label2,knee2score2,knee2cost2]=predict(mdl7,Sample3(:,7));
 knee2=knee2label2;

 [kneelabel2,kneescore2,kneecost2]=predict(mdl8,Sample3(:,6));
 knee=kneelabel2;

 [kneerangelabel2,kneerangescore2,kneerangecost2]=predict(mdl9,Sample3(:,8));
 kneerange=kneerangelabel2;

 [loadinglabel2,loadingscore2,loadingcost2]=predict(mdl10,Sample3(:,9));
  loading=loadinglabel2;
  
  [hip20label2,hip20score2,hip20cost2]=predict(mdl11,Sample3(:,10));
   hip20=hip20label2;
  
  [hip50label2,hip50score2,hip50cost2]=predict(mdl12,Sample3(:,11));
   hip50=hip50label2;
  
   [hip501label2,hip501score2,hip501cost2]=predict(mdl13,Sample3(:,12));
   hip501=hip501label2;
  
  [knee202label,knee202score2,knee202cost2]=predict(mdl14,Sample3(:,13));
   knee20=knee202label;

 [biolabel2,bioscore2,biocost2]=predict(mdl15,Sample3(:,[6,7,9,10,11,12,13]));
   bio=biolabel2;
   
     [alllabel,allscore,allcost]=predict(mdl16,Sample3(:,[1,2,3,4,5,6,7,9,10,11,12,13]));
    all=alllabel;
    
       [twolabel,twoscore,twocost]=predict(mdl17,Sample3(:,[5,6,7,9,10,11,12,13]));
    two=twolabel;

% %%% Classification Error %%%
%  L_all=loss(mdl1,Sample3(:,[1,2,3,4,5]),Actual2);
%  L_QOL=loss(mdl2,Sample3(:,5),Actual2);
%  L_symptom=loss(mdl3,Sample3(:,2),Actual2);
%  L_ADL=loss(mdl4,Sample3(:,3),Actual2);
%  L_SR=loss(mdl5,Sample3(:,4),Actual2);
%  L_Pain=loss(mdl6,Sample3(:,1),Actual2);
% L_knee2=loss(mdl7,Sample3(:,7),Actual2);
% L_knee=loss(mdl8,Sample3(:,6),Actual2);
% L_kneerange=loss(mdl9,Sample3(:,8),Actual2);
%  L_loading=loss(mdl10,Sample3(:,9),Actual2);
%   L_hip20=loss(mdl11,Sample3(:,10),Actual2);
%   L_hip50=loss(mdl12,Sample3(:,11),Actual2);
%   L_hip501=loss(mdl13,Sample3(:,12),Actual2);
%  L_knee20=loss(mdl14,Sample3(:,13),Actual2);
% L_bio=loss(mdl15,Sample3(:,[6,7,8,9,10,11,12,13]),Actual2);
%  L_all=loss(mdl6,Sample3,Actual2);  



[I1,P1,T1,AUC1,OPTROCPT1] = perfcurve(Actual2,all22,'C');
[I2,P2,T2,AUC2,OPTROCPT2] = perfcurve(Actual2,QOL22,'C');
[I3,P3,T3,AUC3,OPTROCPT3] = perfcurve(Actual2,symptom22,'C');
[I4,P4,T4,AUC4,OPTROCPT4] = perfcurve(Actual2,ADL2,'C');
[I5,P5,T5,AUC5,OPTROCPT5] = perfcurve(Actual2,SR2,'C');
[I6,P6,T6,AUC6,OPTROCPT6] = perfcurve(Actual2,Pain2,'C');
[I7,P7,T7,AUC7,OPTROCPT7] = perfcurve(Actual2,knee22,'C');
[I8,P8,T8,AUC8,OPTROCPT8] = perfcurve(Actual2,knee201,'C');
[I9,P9,T9,AUC9,OPTROCPT9] = perfcurve(Actual2,kneerange2,'C');
[I10,P10,T10,AUC10,OPTROCPT10] = perfcurve(Actual2,knee202,'C');
[I11,P11,T11,AUC11,OPTROCPT11] = perfcurve(Actual2,loading2,'C');
[I12,P12,T12,AUC12,OPTROCPT12] = perfcurve(Actual2,hip202,'C');
[I13,P13,T13,AUC13,OPTROCPT13] = perfcurve(Actual2,hip502,'C');
[I14,P14,T14,AUC14,OPTROCPT14] = perfcurve(Actual2,hip5012,'C');
[I15,P15,T15,AUC15,OPTROCPT15] = perfcurve(Actual2,bio2,'C');
[I16,P16,T16,AUC16,OPTROCPT16] = perfcurve(Actual2,all20,'C');
[I17,P17,T17,AUC17,OPTROCPT17] = perfcurve(Actual2,two2,'C');

figure(1)
hold on
plot(I1(1:3,1),P1(1:3,1),'r')
hold on
plot(I2(1:3,1),P2(1:3,1),'g')
hold on
plot(I3(1:3,1),P3(1:3,1),'b')
hold on
plot(I4(1:3,1),P4(1:3,1),'c')
hold on
plot(I5(1:3,1),P5(1:3,1),'m')
hold on
plot(I6(1:3,1),P6(1:3,1),'y')
hold on
plot(I7(1:3,1),P7(1:3,1), 'k')
hold on
plot(I8(1:3,1),P8(1:3,1),'--r')
hold on
plot(I9(1:3,1),P9(1:3,1),'--g')
hold on
plot(I10(1:3,1),P10(1:3,1),'--b')
hold on
plot(I11(1:3,1),P11(1:3,1),'--c')
hold on
plot(I12(1:3,1),P12(1:3,1),'--m')
hold on
plot(I13(1:3,1),P13(1:3,1),'--y')
hold on
plot(I14(1:3,1),P14(1:3,1),'--k')
hold on
plot(I15(1:3,1),P15(1:3,1),':r')
hold on
plot(I16(1:3,1),P16(1:3,1),':g')
hold on
plot(I17(1:3,1),P17(1:3,1),':k')
hold on
legend('all outcomes','QOL','Symptom','ADL','SR','Pain','knee 1st 50%','knee 2nd 50%', 'knee range',...
    'knee 1st 20%','loading 1st 10%',' hip 1st 20%','hip 2nd 50%', 'hip 1st 50%', 'allbio', 'everything','two')
xlabel('False positive rate')
ylabel('True positive rate')
pause
hold off
close figure 1


covariance=nancov(Sample2(1:84,5),Sample2(1:84,7));

% Calculate the eigenvectors and eigenvalues
% covariance = cov(data);
[eigenvec, eigenval ] = eig(covariance);

% Get the index of the largest eigenvector
[largest_eigenvec_ind_c, r] = find(eigenval == max(max(eigenval)));
largest_eigenvec = eigenvec(:, largest_eigenvec_ind_c);

% Get the largest eigenvalue
largest_eigenval = max(max(eigenval));

% Get the smallest eigenvector and eigenvalue
if(largest_eigenvec_ind_c == 1)
    smallest_eigenval = max(eigenval(:,2));
    smallest_eigenvec = eigenvec(:,2);
else
    smallest_eigenval = max(eigenval(:,1));
    smallest_eigenvec = eigenvec(1,:);
end

% Calculate the angle between the x-axis and the largest eigenvector
angle = atan2(largest_eigenvec(2), largest_eigenvec(1));

% This angle is between -pi and pi.
% Let's shift it such that the angle is between 0 and 2pi
if(angle < 0)
    angle = angle + 2*pi;
end

% Get the coordinates of the data mean
avg = nanmean(Sample2(1:84,[5 7]));

% Get the 95% confidence interval error ellipse
chisquare_val = 2.4477;
theta_grid = linspace(0,2*pi);
phi = angle;
X0=avg(1);
Y0=avg(2);
a=chisquare_val*sqrt(largest_eigenval);
b=chisquare_val*sqrt(smallest_eigenval);

% the ellipse in x and y coordinates 
ellipse_x_r  = a*cos( theta_grid );
ellipse_y_r  = b*sin( theta_grid );


%Define a rotation matrix
R = [ cos(phi) sin(phi); -sin(phi) cos(phi) ];

%let's rotate the ellipse to some angle phi
r_ellipse = [ellipse_x_r;ellipse_y_r]' * R;

% Draw the error ellipse
plot(r_ellipse(:,1) + X0,r_ellipse(:,2) + Y0,'-')
hold on;




covariance=nancov(Sample2(85:126,5),Sample2(85:126,7));

% Calculate the eigenvectors and eigenvalues
% covariance = cov(data);
[eigenvec, eigenval ] = eig(covariance);

% Get the index of the largest eigenvector
[largest_eigenvec_ind_c, r] = find(eigenval == max(max(eigenval)));
largest_eigenvec = eigenvec(:, largest_eigenvec_ind_c);

% Get the largest eigenvalue
largest_eigenval = max(max(eigenval));

% Get the smallest eigenvector and eigenvalue
if(largest_eigenvec_ind_c == 1)
    smallest_eigenval = max(eigenval(:,2));
    smallest_eigenvec = eigenvec(:,2);
else
    smallest_eigenval = max(eigenval(:,1));
    smallest_eigenvec = eigenvec(1,:);
end

% Calculate the angle between the x-axis and the largest eigenvector
angle = atan2(largest_eigenvec(2), largest_eigenvec(1));

% This angle is between -pi and pi.
% Let's shift it such that the angle is between 0 and 2pi
if(angle < 0)
    angle = angle + 2*pi;
end

% Get the coordinates of the data mean
avg = nanmean(Sample2(85:126,[5 7]));

% Get the 95% confidence interval error ellipse
chisquare_val = 2.4477;
theta_grid = linspace(0,2*pi);
phi = angle;
X0=avg(1);
Y0=avg(2);
a=chisquare_val*sqrt(largest_eigenval);
b=chisquare_val*sqrt(smallest_eigenval);

% the ellipse in x and y coordinates 
ellipse_x_r  = a*cos( theta_grid );
ellipse_y_r  = b*sin( theta_grid );


%Define a rotation matrix
R = [ cos(phi) sin(phi); -sin(phi) cos(phi) ];

%let's rotate the ellipse to some angle phi
r_ellipse = [ellipse_x_r;ellipse_y_r]' * R;

% Draw the error ellipse
plot(r_ellipse(:,1) + X0,r_ellipse(:,2) + Y0,'-')
hold on;





%      [twolabel3,twoscore3,twocost3]=predict(mdl17,B_prediction(:,[5,6,7,9,10,11,12,13]));
%    two3=twolabel3;
   
%       [twolabel3,twoscore3,twocost3]=predict(mdl2,B_prediction(:,5));
%    two3=twolabel3;
   
      [twolabel3,twoscore3,twocost3]=predict(mdl15,B_prediction(:,[6,7,9,10,11,12,13]));
   two3=twolabel3;
  


  gscatter(Sample2(:,5),Sample2(:,7),Y2,'rb','+o');
  
xmin = 0;
ymin = 0;
xmax = max(max(Sample2(:,5)));
ymax = max(max(Sample2(:,7)));

axis([xmin,xmax,ymin,ymax])

  title('KNN Prediction model')
  xlabel('QOL')
  ylabel ('Second peak external adduction moment')
  legend('A','C','','');
  legend('location','best');
    hold on
    pause
 


 gscatter(B_prediction(:,5),B_prediction(:,7),two3,'kk','.^');
axis([xmin,xmax,ymin,ymax])
 legend('A','C','Ba','Bc');
 legend('location','best');
 hold on
 pause
%  gscatter(B_prediction(:,5),B_prediction(:,7),QOL3,'mm','.^');
% 
%   legend('A','C','Ba','Bc','Ba','Bc');
%  legend('location','best');
%  hold on
%  pause
%  hold off
 close figure 1


