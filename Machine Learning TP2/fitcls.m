function [w,ersub] = fitcls(X,T)
%UNTITLED4 
    %Degr� du polynome de classification
    nbClass = min(size(T));
    setSize=size(X);
    degree=1;
    %Cr�ation de la matrice ~X : Analogie avec PHI de la r�gression
    %XTild = ones(setSize,nb_entree(2)+1,degree);
    XTild = ones(setSize(1),setSize(2)+1);
    for ii=2:setSize(2)+1
        XTild(:,ii) = XTild(:,ii).*X(:,ii-1);
    end
    %if (degree>1)
    %for jj=2:degree
    %        XTild(:,2:(nb_entree(2)+1),jj)=XTild(:,2:(nb_entree(2)+1),jj-1).*X;
    %end
    %end
    XTild=XTild';
    w = T'*pinv(XTild);
    disp('lalolo')
    disp(w);
    y=w*XTild;
    ersub=0;
    for ii=1:setSize(1);
        [~,imaxCal]=max(y(1:nbClass,ii));
        [~ ,imaxReel]= max(T(ii,1:nbClass));
        if (imaxCal~=imaxReel)
            ersub=ersub+1;
        end
    end
    ersub=ersub/setSize(1);
    f=@(x,y) w(1,1)-w(2,1)+(w(1,2)-w(2,2))*x+(w(1,3)-w(2,3))*y;
    fc=fcontour(f);
    fc.LevelList = 0; 
end