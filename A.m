%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                         %   Neural Network  %
                         %     3 neurons     %
                         % Resonate and Fire %

                    
                    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% Numerical Integration with the Euler method

clear all;
close all;
hold off; 
clc;

%% Setting parameters

%Samples
Nsamp   = 300;
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
%I_0_1(1,10) = 37;
%With two-consecutive inputs, you have a coincidence detector 
% I_0_1(1,10) = 37;
I_0_1(1,1:11) = 37;

%% Neuron 2
I_0_2 = zeros(1, Nsamp);
%With a single input, the neuron does not fire
% I_0_2(1,10) = 37;
% %With two-consecutive inputs, you have a coincidence detector 
% I_0_2(1,10) = 37;
I_0_2(1,1:11) = 37;
%I_0_2(1,150:160) = -30

%% Neuron 3
I_0_3 = zeros(1, Nsamp);
%With a single input, the neuron does not fire
% I_0_2(1,10) = 37;
% %With two-consecutive inputs, you have a coincidence detector 
% I_0_2(1,10) = 37;
I_0_3(1,1:11) = 37;

%Try to reproduce the other situations
%Insert your code here

spike_1 = zeros(1, Nsamp);
spike_2 = zeros(1, Nsamp);
spike_3 = zeros(1, Nsamp);

%% IF ==> weight between the two neurons
 w12 = 70;
 w13 = 70;
 w21 = 70;
 w23 = 70;
 w31 = -50;
 w32 = -50;
 
 
 s1 = 5;
 s2 = 5;
 s3 = 5;



for it=2:Nsamp
    
    %1 Neuron
    
    dv_1(1,it) = v_1(2,it-1);
    dv_1(2,it) = -(w_1^2)*v_1(1,it-1) - 2*damp_1*v_1(2,it-1) + I_0_3(1,it-1)+ w21*spike_2(1,it-1)+w31*spike_3(1,it-1);
    
    v_1(1,it) = v_1(1,it-1) + dt*dv_1(1,it);
    v_1(2,it) = v_1(2,it-1) + dt*dv_1(2,it);
       
    if (v_1(1,it) >= 1.0)
        spike_1(1,it) = 1;
    else
        spike_1(1,it) = 0;
        
    end
    
    
    
    
      %2 Neuron
    
    dv_2(1,it) = v_2(2,it-1);
    dv_2(2,it) = -(w_2^2)*v_2(1,it-1) - 2*damp_1*v_2(2,it-1) + I_0_2(1,it-1) + w12*spike_1(1,it-1) + w32*spike_3(1,it-1);
    
    v_2(1,it) = v_2(1,it-1) + dt*dv_2(1,it);
    v_2(2,it) = v_2(2,it-1) + dt*dv_2(2,it);
       
    if (v_2(1,it) >= 1.0)
        spike_2(1,it) = 1;
    else
        spike_2(1,it) = 0;
    end
    
    
      %3 Neuron
    
    dv_3(1,it) = v_3(2,it-1);
    dv_3(2,it) = -(w_3^2)*v_3(1,it-1) - 2*damp_1*v_3(2,it-1) + I_0_3(1,it-1) + w13*spike_1(1,it-1) + w23*spike_2(1,it-1);
    
    v_3(1,it) = v_3(1,it-1) + dt*dv_3(1,it);
    v_3(2,it) = v_3(2,it-1) + dt*dv_3(2,it);
       
    if (v_3(1,it) >= 1.0)
        spike_3(1,it) = 1;
    else
        spike_3(1,it) = 0;
    end
    
    
end


figure('Name','Spikes, Membrane Potential, and Input Current','units','normalized','outerposition',[.5 .5 .6 1]) 


subplot(3, 1, 1)
stem(times, spike_1(1,:))
hold on; stem(times, spike_2(1,:))
hold on; stem(times, spike_3(1,:))
xlabel('Spike'); 

subplot(3,1,2)
   plot(1:1:Nsamp,v_1(1,:));
   hold on; plot(1:1:Nsamp,v_2(1,:));
   hold on; plot(1:1:Nsamp,v_3(1,:));
   hline = refline([0 1]);
   hline.Color = 'r';
   xlabel('Time [ms]'); ylabel('v [mV]')
   
subplot(3,1,3)
   stem(times, I_0_1(1,:))
   hold on;
    stem(times, I_0_2(1,:))
    hold on;
    stem(times, I_0_3(1,:))
    xlabel('Initial Injection'); ylabel('v [mV]')

    