%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                         %   Neural Network  %
                         %    XOR problem    %
                         % Resonate and Fire %
                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
hold off; 
clc;

%% Setting parameters

%Samples
Nsamp   = 50;
%Damping factor
damp_1  = 2.5;
%Natural frequency, make oscillations of 1.1Hz
w_1     = 1.1*2*pi;
w_2     = 1.1*2*pi;
w_3     = 1.1*2*pi;
%Time-step
dt      = 0.1; 

times = 0:dt:(Nsamp*dt - dt);

dv_1 = zeros(2, Nsamp);
v_1 = zeros(2, Nsamp);

dv_2 = zeros(2, Nsamp);
v_2 = zeros(2, Nsamp);

dv_3 = zeros(2, Nsamp);
v_3 = zeros(2, Nsamp);




%% Neuron 1
I_0_1 = zeros(1, Nsamp);
%With a single input, the neuron does not fire
I_0_1 = 60;
%With two-consecutive inputs, you have a coincidence detector 
% I_0_1(1,10) = 37;


%% Neuron 2
% I_0_2 = zeros(1, Nsamp);
%With a single input, the neuron does not fire
% I_0_2(1,10) = 37;
% %With two-consecutive inputs, you have a coincidence detector 
I_0_2(1,1:Nsamp) = 37;
% I_0_2(1,1:50) = 37;
% I_0_2 = 37;

%% Neuron 3
I_0_3 = zeros(1, Nsamp);
%With a single input, the neuron does not fire
% I_0_2(1,10) = 37;
% %With two-consecutive inputs, you have a coincidence detector 
% I_0_2(1,10) = 37;
I_0_3(1,1:10) = 37;

%Try to reproduce the other situations
%Insert your code here

spike_1 = zeros(1, Nsamp);
spike_2 = zeros(1, Nsamp);
spike_3 = zeros(1, Nsamp);

%% IF ==> weight between the two neurons

 w13 = 30;
 w23 = -30;

 
%% Initial Injection 

 I_I = zeros(1, Nsamp);
 I_I(1,2) = 30; %% Initial injection
 
 
 %% Current Injection for XOR problem 
 
    Inj_1 = zeros(4,Nsamp);
    Inj_2 = zeros(4,Nsamp);
 
    Inj_1(1,10) = 0*I_0_1;
    Inj_2(1,10) = 0*I_0_1;
    
    Inj_1(2,10) = 1*I_0_1;
    Inj_2(2,10) = 0*I_0_1;
    
    Inj_1(3,10) = 0*I_0_1;
    Inj_2(3,10) = 1*I_0_1;
    
    Inj_1(4,10) = 1*I_0_1;
    Inj_2(4,10) = 1*I_0_1;
 
    
    
for h=1:4  

 
for it=2:Nsamp
    

    %1 Neuron
    
    dv_1(1,it) = v_1(2,it-1);
    dv_1(2,it) = -(w_1(1,1)^2)*v_1(1,it-1) - 2*damp_1*v_1(2,it-1) +  Inj_1(h,it) + I_I(it) ; %% weight 1 * Inputs (first line)
    
    v_1(1,it) = v_1(1,it-1) + dt*dv_1(1,it);
    v_1(2,it) = v_1(2,it-1) + dt*dv_1(2,it);
       
    if (v_1(1,it) >= 1.0)
        spike_1(1,it) = 1;
    else
        spike_1(1,it) = 0;
        
    end
    
    
    
    
      %2 Neuron
    
    dv_2(1,it) = v_2(2,it-1);
    dv_2(2,it) = -(w_2(1,1)^2)*v_2(1,it-1) - 2*damp_1*v_2(2,it-1) + Inj_2(h,it) + I_I(it); %% weight 2 * Inputs (second line)
    
    v_2(1,it) = v_2(1,it-1) + dt*dv_2(1,it);
    v_2(2,it) = v_2(2,it-1) + dt*dv_2(2,it);
       
    if (v_2(1,it) >= 1.0)
        spike_2(1,it) = 1;
    else
        spike_2(1,it) = 0;
    end
    
    
      %3 Neuron
    
    dv_3(1,it) = v_3(2,it-1);
    dv_3(2,it) = -(w_3(1,1)^2)*v_3(1,it-1) - 2*damp_1*v_3(2,it-1) + w13*spike_1(1,it-1) + w23*spike_2(1,it-1)+ I_I(it); 
    v_3(1,it) = v_3(1,it-1) + dt*dv_3(1,it);
    v_3(2,it) = v_3(2,it-1) + dt*dv_3(2,it);
       
    if (v_3(1,it) >= 1.0)
        spike_3(1,it) = 1;
    else
        spike_3(1,it) = 0;
    end
    
a = Inj_1(h,10)>0;
b = Inj_2(h,10)>0;



figure (h)
subplot(3,1,1)

plot(1:1:Nsamp,v_1(1,:))
hline = refline([0 1]);
hline.Color = 'r';
xlabel(' Neuron 1');
ylabel(' Membran Potential');
hold on;
 

subplot(3,1,2)
plot(1:1:Nsamp,v_2(1,:))
hline = refline([0 1]);
hline.Color = 'r';
xlabel(' Neuron 2');
ylabel(' Membran Potential');
hold on; 

subplot(3,1,3)
plot(1:1:Nsamp,v_3(1,:))
hline = refline([0 1]);
hline.Color = 'r';
xlabel(' Neuron 3');
ylabel(' Membran Potential');
txt = ['Input 1 :  ',num2str(a),'   ', 'Input 2 :  ',num2str(b)];
sgt = sgtitle(txt)
sgt.FontSize = 15;





end 
end
