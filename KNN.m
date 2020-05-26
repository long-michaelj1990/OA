%ML Knee OA

load Training
load Classification
load Sample
load Actual

mdl=ClassificationKNN.fit(X(:,[1,2,3,4,5]),Y,'NumNeighbors',13);

%Resubstitution loss fraction of misclassification from predictions of mdl% 
allrloss=resubLoss(mdl);

%construct a cross-validated classifier from the model%
allcvmdl=crossval(mdl);

%Examine cross-validation loss when predicting data not used for
%training%
allkloss=kfoldLoss(allcvmdl);

[alllabel,allscore,allcost]=predict(mdl,Sample (:,[1,2,3,4,5]));
all=alllabel;

gscatter(Sample(:,5),Sample(:,6),all,'r','+ox');
title('QOL Prediction')
legend('A','B','C')
xlabel('outcome score')
ylabel ('Knee moment 1st 50%')
legend('location','best');
hold on
pause
 
gscatter(Sample(:,5),Sample(:,6),Actual,'k','+ox');
title('QOL Actual')
legend('A','B','C','A2','B2','C2');
legend('location','best');
hold on
pause
hold off
close figure 1
mdl=[];


mdl =[];

mdl=ClassificationKNN.fit(X(:,5),Y,'NumNeighbors',8);

%Resubstitution loss fraction of misclassification from predictions of mdl% 
QOLrloss=resubLoss(mdl);

%construct a cross-validated classifier from the model%
QOLcvmdl=crossval(mdl);

%Examine cross-validation loss when predicting data not used for
%training%
QOLkloss=kfoldLoss(QOLcvmdl);


[QOLlabel,QOLscore,QOLcost]=predict(mdl,Sample (:,5));
QOL=QOLlabel;
%L_QOL=loss(mdl,Sample(:,5),Actual);

% gscatter(Sample(:,5),Sample(:,6),QOL,'r','+ox');
% title('QOL Prediction')
% legend('A','B','C')
% xlabel('outcome score')
% ylabel ('Knee moment 2nd 50%')
% legend('location','best');
% hold on
% pause
%  
% gscatter(Sample(:,5),Sample(:,6),Actual,'k','+ox');
% title('QOL Actual')
% legend('A','B','C','A2','B2','C2');
% legend('location','best');
% hold on
% pause
% hold off
% close figure 1
% mdl=[];

mdl=ClassificationKNN.fit(X(:,2),Y,'NumNeighbors',7);

%Resubstitution loss fraction of misclassification from predictions of mdl% 
symptomrloss=resubLoss(mdl);

%construct a cross-validated classifier from the model%
symptomcvmdl=crossval(mdl);

%Examine cross-validation loss when predicting data not used for
%training%
symptomkloss=kfoldLoss(symptomcvmdl);


[symptomlabel,symptomscore,symptomcost]=predict(mdl,Sample (:,2));
Symptom=symptomlabel;
%L_Symptom=loss(mdl,Sample(:,2),Actual);

% gscatter(Sample(:,2),Sample(:,6),Symptom,'r','+ox');
% title('Symptom prediction')
% legend('A','B','C')
% xlabel('outcome score')
% ylabel ('Knee moment 2nd 50%')
% legend('location','best');
% hold on
% pause
%  
% gscatter(Sample(:,2),Sample(:,6),Actual,'k','+ox');
% title('Symptom Actual')
% legend('A','B','C','A2','B2','C2');
% legend('location','best');
% hold on
% pause
% hold off
% close figure 1
%  mdl =[];

mdl=ClassificationKNN.fit(X(:,1),Y,'NumNeighbors',6)

%Resubstitution loss fraction of misclassification from predictions of mdl% 
painrloss=resubLoss(mdl);

%construct a cross-validated classifier from the model%
paincvmdl=crossval(mdl);

%Examine cross-validation loss when predicting data not used for
%training%
painkloss=kfoldLoss(paincvmdl);

[painlabel,painscore,paincost]=predict(mdl,Sample(:,1));
Pain=painlabel;
%L_Pain=loss(mdl,Sample(:,1),Actual);

% gscatter(Sample(:,1),Sample(:,6),Pain,'r','+ox');
% title('pain prediction')
% legend('A','B','C')
% xlabel('outcome score')
% ylabel ('Knee moment 2nd 50%')
% legend('location','best');
% hold on
% pause
%  
% gscatter(Sample(:,1),Sample(:,6),Actual,'k','+ox');
% title('pain Actual')
% legend('A','B','C','A2','B2','C2');
% legend('location','best');
% hold on
% pause
% hold off
% close figure 1
%  mdl =[];

mdl=ClassificationKNN.fit(X(:,3),Y,'NumNeighbors',5);

%Resubstitution loss fraction of misclassification from predictions of mdl% 
ADLrloss=resubLoss(mdl);

%construct a cross-validated classifier from the model%
ADLcvmdl=crossval(mdl);

%Examine cross-validation loss when predicting data not used for
%training%
ADLkloss=kfoldLoss(ADLcvmdl);

[ADLlabel,ADLscore,ADLcost]=predict(mdl,Sample (:,3));
ADL=ADLlabel;
%L_ADL=loss(mdl,Sample(:,3),Actual);

% gscatter(Sample(:,3),Sample(:,6),ADL,'r','+ox');
% title('ADL prediction')
% legend('A','B','C')
% xlabel('outcome score')
% ylabel ('Knee moment 2nd 50%')
% legend('location','best');
% hold on
% pause
%  
% gscatter(Sample(:,3),Sample(:,6),Actual,'k','+ox');
% title('ADL Actual')
% legend('A','B','C','A2','B2','C2');
% legend('location','best');
% hold on
% pause
% hold off
% close figure 1
%  mdl =[];


mdl=ClassificationKNN.fit(X(:,4),Y,'NumNeighbors',11);

%Resubstitution loss fraction of misclassification from predictions of mdl% 
SRrloss=resubLoss(mdl);

%construct a cross-validated classifier from the model%
SRcvmdl=crossval(mdl);

%Examine cross-validation loss when predicting data not used for
%training%
SRkloss=kfoldLoss(SRcvmdl);

[SRlabel,SRscore,SRcost]=predict(mdl,Sample (:,4));
SR=SRlabel;
%L_SR=loss(mdl,Sample(:,4),Actual);

% gscatter(Sample(:,4),Sample(:,6),SR,'r','+ox');
% title('SR prediction')
% legend('A','B','C')
% xlabel('outcome score')
% ylabel ('Knee moment 2nd 50%')
% legend('location','best');
% hold on
% pause
% 
% gscatter(Sample(:,4),Sample(:,6),Actual,'k','+ox');
% title('SR Actual')
% legend('A','B','C','A2','B2','C2');
% legend('location','best');
% hold on
% pause
% hold off
% close figure 1

mdl=[];

mdl=[];

mdl=ClassificationKNN.fit(X(:,6),Y,'NumNeighbors',5)%Best K for leeast error%
 
%Resubstitution loss fraction of misclassification from predictions of mdl% 
knee1rloss=resubLoss(mdl);

%construct a cross-validated classifier from the model%
knee1cvmdl=crossval(mdl);

%Examine cross-validation loss when predicting data not used for
%training%
knee1kloss=kfoldLoss(knee1cvmdl);

[knee1label,knee1score,knee1cost]=predict(mdl,Sample (:,6));
knee1=knee1label;

% gscatter(Sample(:,5),Sample(:,6),knee1,'r','+ox');
% title('knee moment 1st 50 % prediction')
% legend('A','B','C')
% xlabel('QOL')
% ylabel ('Knee moment 1st 50%')
% legend('location','best');
% hold on
% pause
% 
% gscatter(Sample(:,5),Sample(:,6),Actual,'k','+ox');
% title('Knee moment 1st 50 % Actual')
% legend('A','B','C','A2','B2','C2');
% legend('location','best');
% hold on
% pause
% hold off
% close figure 1

mdl=[];

mdl=ClassificationKNN.fit(X(:,7),Y,'NumNeighbors',4)%Best K for leeast error%
 
%Resubstitution loss fraction of misclassification from predictions of mdl% 
knee2rloss=resubLoss(mdl);

%construct a cross-validated classifier from the model%
knee2cvmdl=crossval(mdl);

%Examine cross-validation loss when predicting data not used for
%training%
knee2kloss=kfoldLoss(knee2cvmdl);

[knee2label,knee2score,knee2cost]=predict(mdl,Sample (:,7));
knee2=knee2label;

% gscatter(Sample(:,5),Sample(:,7),knee2,'r','+ox');
% title('knee moment 2nd 50 % prediction')
% legend('A','B','C')
% xlabel('QOL')
% ylabel ('Knee moment 2nd 50%')
% legend('location','best');
% hold on
% pause
% 
% gscatter(Sample(:,5),Sample(:,7),Actual,'k','+ox');
% title('Knee moment 2nd 50 % Actual')
% legend('A','B','C','A2','B2','C2');
% legend('location','best');
% hold on
% pause
% hold off
% close figure 1

mdl=[];


mdl=ClassificationKNN.fit(X(:,8),Y,'NumNeighbors',8)%Best K for leeast error%
 
%Resubstitution loss fraction of misclassification from predictions of mdl% 
kneerangerloss=resubLoss(mdl);

%construct a cross-validated classifier from the model%
kneerangecvmdl=crossval(mdl);

%Examine cross-validation loss when predicting data not used for
%training%
kneerangekloss=kfoldLoss(kneerangecvmdl);

[kneerangelabel,kneerangescore,kneerangecost]=predict(mdl,Sample (:,8));
kneerange=kneerangelabel;

% gscatter(Sample(:,5),Sample(:,8),kneerange,'r','+ox');
% title('knee range prediction')
% legend('A','B','C')
% xlabel('QOL')
% ylabel ('Knee range')
% legend('location','best');
% hold on
% pause
% 
% gscatter(Sample(:,5),Sample(:,8),Actual,'k','+ox');
% title('Knee rangeActual')
% legend('A','B','C','A2','B2','C2');
% legend('location','best');
% hold on
% pause
% hold off
% close figure 1
