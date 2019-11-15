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
    
   ![Screen Shot 2019-11-15 at 23 32 12](https://user-images.githubusercontent.com/55028120/68980232-2dd24a80-0800-11ea-99a3-e1082025010d.png)

    

# XOR Problem 3 neurons

The XOR problem can be explained by the separation of squares and circles as represented. A single neuron cannot solve this non-linear problem. 

![Screen Shot 2019-11-15 at 23 33 57](https://user-images.githubusercontent.com/55028120/68980327-74c04000-0800-11ea-9e77-dbd4fb4b6eca.png)

However, the implementation of a feedforward neural network of resonate and fire neurons can solve it. This is due to the bounce of membrane potential with this type of neuron. 

- 3 neurons, two are considered as inputs and the last one as the neurons which solve the XOR problem.
- Graphic representation of: 
    - Each case of XOR with membrane potential of the three neurons over time.

### Input 1 0 ==> Output 1

In the first two neurons, only the excitatory fires that leads to the activation of the third neuron. 

![Screen Shot 2019-11-15 at 23 37 48](https://user-images.githubusercontent.com/55028120/68980844-f795ca80-0801-11ea-9743-52a3382f04d9.png)

### Input 0 1 ==> Output 1

In the first two neurons, only the inhibitory fires that leads to negative injection to the third one but the rebounce of membrane potential in the RAF provide the firing of the neuron.

![Screen Shot 2019-11-15 at 23 37 55](https://user-images.githubusercontent.com/55028120/68980790-c3baa500-0801-11ea-9d60-dcf80b49b991.png)


### Input 0 1 ==> Output 1

The first two neurons fire but since one is excitatory and one inhibitory their inputs to the last neurons are cancel and the last neuron does not fire. 

![Screen Shot 2019-11-15 at 23 46 05](https://user-images.githubusercontent.com/55028120/68980913-201dc480-0802-11ea-9c4e-0ef36fded250.png)





# References 

(1) https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6036256/


(2) https://www.jneurosci.org/content/34/44/14589/tab-figures-data
