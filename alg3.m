%dziala na losowe konty

D = [1001 903 1001 903 1001 903 1001] %tablica ruchow 1
D1 = [101 90 100 90 100 90 101] %tablica ruchow Prawy 2
D2 = [100 90 102 90 100 90 100] %tablica ruchow Lewy 2
X = [0 0 0 0 0 0 0] % tablica wynikowa1
Y = [0 0 0 0 0 0 0] % tablica wynikowa1
X_wykres_jazdy_wynik = [0 0 0 0 0 0 0] % tablica wynikowa wykresu jazdy2
Y_wykres_jazdy_wynik = [0 0 0 0 0 0 0] % tablica wynikowa wykresu jazdy2
X_wy=[0,0,0,0,0]  %tablica do wykresu1
Y_wy=[0,0,0,0,0] %jedno zero jest wiencej bo strtujemy od 01
X_wy_wykresu_jazdy=[0,0,0,0,0]  %tablica do wykresu jazdy2
Y_wy_wykresu_jazdy=[0,0,0,0,0] %jedno zero jest wiencej bo strtujemy od 02
i=2; % to potrzebne do tablicy wykresu1
Fi  = 360; % kont poczonktkowy1
Fi2 = 360; % kont poczontkowy realny2
fi_1 = 0; %zmienna do sprawdzenia konta2
tiki_konta = 0; %2
kont_przesuniencia = 0; %2
r=0;%2
r_robota=0;%2
a=0;%2
b=0;%2
X_poprzednie = 0; %1
Y_poprzednie = 0; %1
X_poprzednie2 = 0; %2
Y_poprzednie2 = 0; %2
tablica_a = [0 0 0 0 0 0 0];
tablica_rb = [0 0 0 0 0 0 0];
f1= [0 0 0 0 0 0 0]
f2= [0 0 0 0 0 0 0]
f3= [0 0 0 0 0 0 0]
f4= [0 0 0 0 0 0 0]
f5= [0 0 0 0 0 0 0]
f6= [0 0 0 0 0 0 0]
f7= [0 0 0 0 0 0 0]
f8= [0 0 0 0 0 0 0]
f9= [0 0 0 0 0 0 0]
f10= [0 0 0 0 0 0 0]
f11= [0 0 0 0 0 0 0]
f12= [0 0 0 0 0 0 0]
f13= [0 0 0 0 0 0 0]
f14= [0 0 0 0 0 0 0]
f15= [0 0 0 0 0 0 0]
f16= [0 0 0 0 0 0 0]
f17= [0 0 0 0 0 0 0]
f18= [0 0 0 0 0 0 0]
f19= [0 0 0 0 0 0 0]
f20= [0 0 0 0 0 0 0]
for c=1:length(D) %1
    tiki = (floor(D(c)/10)); %1
    tmp = D(c)-(tiki*10); % obliczenie ruchu %1 
    
    %sprawdzenie konta2
    if(Fi2>360) %2
        while(Fi2>360)%2
            fi_1 = Fi2-360;%2
            Fi2=fi_1;%2
        end%2
    end%2
    if(Fi2==360)
       Fi2=0; 
    end
    
    tiki_konta = D1(c)-D2(c); %2
    f1(c)=Y_poprzednie2;
    if(tmp == 1) %1
           %jazda do przodu ++1
           
           X(c)=X_poprzednie +tiki*cos((Fi*pi)/180);%1
           Y(c)=Y_poprzednie +tiki*sin((Fi*pi)/180);%1
           X_poprzednie = X(c);%1
           Y_poprzednie = Y(c);%1
           if(tiki_konta == 0)%2
           X_wykres_jazdy_wynik(c) = X_poprzednie2+tiki*cos((Fi2*pi)/180);%2
           Y_wykres_jazdy_wynik(c) =Y_poprzednie2 +tiki*sin((Fi2*pi)/180);%2
           X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
           Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
           end%2
            
            if(tiki_konta<0)
                 kont_przesuniencia = tiki_konta*0.44;%2
                r=((tiki*360)/(2*pi*kont_przesuniencia));%2
                r_robota= r+13.021461;%2
    
                 a= sin((kont_przesuniencia*pi)/180)*r_robota;%2
                    b= cos((kont_przesuniencia*pi)/180)*r_robota;%2
                
                if(Fi2==0|Fi2==360)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2 +a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2 +(r_robota-b);%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
                if(Fi2>0&Fi2<90)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2 -cos((Fi2*pi)/180)*(r_robota-b)+cos((Fi2*pi)/180)*a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2 +sin((Fi2*pi)/180)*(r_robota-b)+sin((Fi2*pi)/180)*a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
                if(Fi2==90)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2 -(r_robota-b);%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2  +a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
                if(Fi2>90&Fi2<180)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2-sin(((Fi2-90)*pi)/180)*(r_robota-b)-sin(((Fi2-90)*pi)/180)*a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2-cos(((Fi2-90)*pi)/180)*(r_robota-b)+cos(((Fi2-90)*pi)/180)*a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
                if(Fi2==180)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2 -a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2 -(r_robota-b);%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
                if(Fi2>180&Fi2<270)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2+cos(((Fi2-180)*pi)/180)*(r_robota-b)-cos(((Fi2-180)*pi)/180)*a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2-sin(((Fi2-180)*pi)/180)*(r_robota-b)-sin(((Fi2-180)*pi)/180)*a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
                if(Fi2==270)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2 + (r_robota-b);%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2 - a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
                if(Fi2>270&Fi2<360)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2+sin(((Fi2-270)*pi)/180)*(r_robota-b)+sin(((Fi2-270)*pi)/180)*a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2+cos(((Fi2-270)*pi)/180)*(r_robota-b)-cos(((Fi2-270)*pi)/180)*a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
        
        
        
        
            end
            if(tiki_konta>0)
                 kont_przesuniencia = tiki_konta*0.44;%2
                r=((tiki*360)/(2*pi*kont_przesuniencia));%2
                r_robota= r+13.021461;%2
    
                 a= sin((kont_przesuniencia*pi)/180)*r_robota;%2
                    b= cos((kont_przesuniencia*pi)/180)*r_robota;%2
                switch Fi2
                    case 0
        X_wykres_jazdy_wynik(c) = X_poprzednie2 +a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2 -(r_robota-b);%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
    case 90
         X_wykres_jazdy_wynik(c) = X_poprzednie2 +(r_robota-b);%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2  +a;%2
                  X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                   Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                   Fi2=Fi2+kont_przesuniencia;%2
    case 180
        X_wykres_jazdy_wynik(c) = X_poprzednie2 -a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2 +(r_robota-b);%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
        case 270
         X_wykres_jazdy_wynik(c) = X_poprzednie2 - (r_robota-b);%2
                   Y_wykres_jazdy_wynik(c) =Y_poprzednie2 - a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
    otherwise
        if(Fi2>0&&Fi2<90)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2 +cos((Fi2*pi)/180)*(r_robota-b)+cos((Fi2*pi)/180)*a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2 -sin((Fi2*pi)/180)*(r_robota-b)+sin((Fi2*pi)/180)*a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
               end
             
                if(Fi2>90&&Fi2<180)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2+sin(((Fi2-90)*pi)/180)*(r_robota-b)-sin(((Fi2-90)*pi)/180)*a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2+cos(((Fi2-90)*pi)/180)*(r_robota-b)+cos(((Fi2-90)*pi)/180)*a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
               end
                
              
                if(Fi2>180&&Fi2<270)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2-cos(((Fi2-180)*pi)/180)*(r_robota-b)-cos(((Fi2-180)*pi)/180)*a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2+sin(((Fi2-180)*pi)/180)*(r_robota-b)-sin(((Fi2-180)*pi)/180)*a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
           
                
                if(Fi2>270&&Fi2<360)
                    X_wykres_jazdy_wynik(c) = X_poprzednie2-sin(((Fi2-270)*pi)/180)*(r_robota-b)+sin(((Fi2-270)*pi)/180)*a;%2
                    Y_wykres_jazdy_wynik(c) =Y_poprzednie2-cos(((Fi2-270)*pi)/180)*(r_robota-b)-cos(((Fi2-270)*pi)/180)*a;%2
                    X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
                    Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
                    Fi2=Fi2+kont_przesuniencia;%2
                end
end
                
               
        
        
        
        
            end
    
           
    end%1
    
    if(tmp ==2)%1
        %jazda do tylu%1
        
           X(c)=X_poprzednie -tiki*cos((Fi*pi)/180);%1
           Y(c)=Y_poprzednie -tiki*sin((Fi*pi)/180);%1
           X_poprzednie = X(c);%1
           Y_poprzednie = Y(c);%1
           if(tiki_konta == 0)%2
           X_wykres_jazdy_wynik = X_poprzednie2-tiki*cos((Fi*pi)/180);%2
           Y_wykres_jazdy_wynik = Y_poprzednie2-tiki*sin((Fi*pi)/180);%2
           X_poprzednie2 = X_wykres_jazdy_wynik(c); %2
           Y_poprzednie2 = Y_wykres_jazdy_wynik(c); %2
        end%2
         if(tiki_konta>0)
        
        
        
        
        
    
    end
    if(tiki_konta<0)
        
        
        
        
        
    end
    
    end%1
    
    if(tmp ==3) %1
        %kont++%1
       Fi=Fi+tiki;%1
       Fi2=Fi2+tiki;%2
       
    end%1
    if(tmp == 4)%1
       %kont--%1
       Fi=Fi-tiki;%1
       Fi2=Fi2-tiki;%2
        
    end%1
    
    if(X(c)~=0|Y(c)~=0)%1
        %tu przygotowanie wykresu wynikowego tu robie tak by w wynikowej%1
        %tablicy obcioc konty%1
       X_wy(i)=X(c);%1
       Y_wy(i)=Y(c);%1
       X_wy_wykresu_jazdy(i)=X_wykres_jazdy_wynik(c);%2
       Y_wy_wykresu_jazdy(i)=Y_wykres_jazdy_wynik(c);%2
       
       i=i+1;%1
        
    end%1
    

tablica_a(c) = a;
tablica_rb(c) =(r_robota-b);
end%1
plot(X_wy,Y_wy)%1
hold on%2
plot(X_wy_wykresu_jazdy,Y_wy_wykresu_jazdy)%2
grid;%1
