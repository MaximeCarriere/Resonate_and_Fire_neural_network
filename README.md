# Resonate and Fire Neural Network

Different implementation of the Resonate and Fire Neurons. 

https://www.somasimple.com/pdf_files/resfire.pdf

# Neural_Network_3_neurons

- 3 fully connected neurons, 2 excitatory and 1 inhibitory. 
- The sign of weights (+ or -) defines the type of neuron (excitatory or inhibitory)


  ![Screen Shot 2019-11-15 at 22 47 30](https://user-images.githubusercontent.com/55028120/68978081-1db76c80-07fa-11ea-87a3-c21e6146699f.png)



- Graphic representation of:
    - Injected current 
    - Memrane potential
    - Spike 
    
 ![Screen Shot 2019-11-15 at 22 51 53](https://user-images.githubusercontent.com/55028120/68978280-96b6c400-07fa-11ea-88e9-6ff1f4d06725.png)


# Neural_Network_1000_neurons

- 1000 neurons fully connected, 800 excitatory and 200 inhibitory 
- Graphic representation of:
    - Raster plot
    - Spikes over time for excitatory and inhibitory neurons

# XOR_Problem_3_neurons

The XOR problem cannot be solved by only one neuron. However, the implementation of a feedforward
neural network of resonate and fire neurons can solve it. This is due to the bounce of membrane potential 
with this type of neuron. 

- 3 neurons, two are considered as inputs and the last one as the neurons which solve the XOR problem.
- Graphic representation of: 
    - Each case of XOR with membrane potential of the three neurons over time.
