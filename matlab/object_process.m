
res=getFocuses(maleSubjects,maleWebsites,300);
xlswrite('maleSubjectsmaleWebsites.csv',res);
res=getFocuses(maleSubjects,femaleWebsites,300);
xlswrite('maleSubjectsfemaleWebsites.csv',res);
res=getFocuses(maleSubjects,neutralWebsites,300);
xlswrite('maleSubjectsneutralWebsites.csv',res);

res=getFocuses(femaleSubjects,maleWebsites,300);
xlswrite('femaleSubjectsmaleWebsites.csv',res);
res=getFocuses(femaleSubjects,femaleWebsites,300);
xlswrite('femaleSubjectsfemaleWebsites.csv',res);
res=getFocuses(femaleSubjects,neutralWebsites,300);
xlswrite('femaleSubjectsneutralWebsites.csv',res);