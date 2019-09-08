%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                         %   Neural Network  %
                         %    1000 neurons   %
                         % Resonate and Fire %
                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;
close all;
hold off; 
clc;

% Excitatory neurons   Inhibitory neurons
Ne=800;                Ni=200;
re=rand(Ne,1);         ri=rand(Ni,1); 
S=[rand(Ne+Ni,Ne),-rand(Ne+Ni,Ni)]; 



%% RAF

v_1_1 = zeros(2, 1000)'; %% RAF ==> initializing the membrane potential to zero
v_1_2 = zeros(2, 1000)'; %% RAF ==> initializing the membrane potential to zero

w_1     = 1.1*2*pi; %% change frequency look at the litterature 
w_2     = 1.11111*2*pi;
damp_1  = 2.5;
dt      = 0.1;



firings=[];           % spike timings

for t=2:2000   % simulation of 1000 ms 
    
   
    
   I(:,t) =[4.7*randn(Ne,1);4.7*randn(Ni,1)];
   
   vv = v_1_1(:,t-1);
   fired=find(vv>=1); % indices of spikes ==> if v_1_1 > 1 there is a fire
   if ~isempty(fired)      
      firings=[firings; t+0*fired, fired];     
      I(:,t) = I(:,t) + sum(S(:,fired),2);


   end 

for i = 1:1000
    
    if v_1_1(i,t-1)>=1
        
        I_1(i,t) = round(I(i,t));
        
    end

    if v_1_1(i,t-1)<=1
        
        I_1(i,t) = 0;
    end
     
end 


for h = 1:1000

I_2 (h,t) = I_1(h,t) * sum(S(h,fired),2)';

end

      

   
   %% RAF
   
   
   
    dv_1_1(:,t) = v_1_2(:,t-1);
    dv_1_2(:,t) = [-(w_1^2)*v_1_1(1:800,t-1); -(w_2^2)*v_1_1(801:end,t-1)] - 2*damp_1*v_1_2(:,t-1) + I(:,t) + I_2(:,t);
    
    v_1_1(:,t) = v_1_1(:,t-1) + dt*dv_1_1(:,t);
    v_1_2(:,t) = v_1_2(:,t-1) + dt*dv_1_2(:,t);


   
end


for i=1:size(v_1_1,1)

tata (i) = sum(v_1_1(1:800,i)>1);
tutu (i) = sum(v_1_1(800:1000,i)>1);
boubou (i) = tata(i)/tutu(i);

end



figure (1)
plot(firings(:,1),firings(:,2),'.', 'MarkerSize',0.1);
xlabel('Time (ms)'); ylabel('Neurons');




figure (2) 
subplot(2,1,1)
plot(tata,'r')
xlabel('Time (ms)'); ylabel('Excitatory Spike ');
subplot(2,1,2)
plot(tutu,'b')
xlabel('Time (ms)'); ylabel('Inhibitory Spike ');


