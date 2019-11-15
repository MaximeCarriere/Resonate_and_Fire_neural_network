# Resonate and Fire Neural Network

Different implementation of the Resonate and Fire Neurons. 

https://www.somasimple.com/pdf_files/resfire.pdf

# Neural Network 3 neurons

- 3 fully connected neurons, 2 excitatory and 1 inhibitory. 
- The sign of weights (+ or -) defines the type of neuron (excitatory or inhibitory)


  ![Screen Shot 2019-11-15 at 22 47 30](https://user-images.githubusercontent.com/55028120/68978081-1db76c80-07fa-11ea-87a3-c21e6146699f.png)



- Graphic representation of:
    - Injected current 
    - Memrane potential
    - Spike 
    
    
    
 ![Screen Shot 2019-11-15 at 22 51 53](https://user-images.githubusercontent.com/55028120/68978280-96b6c400-07fa-11ea-88e9-6ff1f4d06725.png)


# Neural Network 1000 neurons

- 1000 neurons fully connected, 800 excitatory and 200 inhibitory 
- Graphic representation of:
    - Raster plot:
        - On the left result from the code
        - On the right similar result from Qing-long and coll., 2018 (1)
    
    ![Screen Shot 2019-11-15 at 22 58 55](https://user-images.githubusercontent.com/55028120/68979469-f19dea80-07fd-11ea-8f11-2a0bfe2bb3ee.png)

    
    - Spikes over time for excitatory and inhibitory neurons
        - On the left results from the code (Red: Excitatory neurons // Blue: Inhibitory neurons)
        - On the right similar result from Barbierie et coll., 2014 (2) 
    
    ![Screen Shot 2019-11-15 at 23 19 45](https://user-images.githubusercontent.com/55028120/68979684-77ba3100-07fe-11ea-8f27-92d6076e4cd4.png)

    

# XOR_Problem_3_neurons

The XOR problem cannot be solved by only one neuron. However, the implementation of a feedforward
neural network of resonate and fire neurons can solve it. This is due to the bounce of membrane potential 
with this type of neuron. 

- 3 neurons, two are considered as inputs and the last one as the neurons which solve the XOR problem.
- Graphic representation of: 
    - Each case of XOR with membrane potential of the three neurons over time.



# References 

(1) https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6036256/
(2) https://www.jneurosci.org/content/34/44/14589/tab-figures-data
