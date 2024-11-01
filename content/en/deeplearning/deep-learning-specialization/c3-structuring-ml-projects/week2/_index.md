---
type: docs
title: "W2 - ML Strategy"
description: "Learn error analysis, data mismatch, transfer, multi-task, and end-to-end deep learning in machine learning."
---



Develop time-saving error analysis procedures to evaluate the most worthwhile options to pursue and gain intuition for how to split your data and when to use multi-task, transfer, and end-to-end deep learning.

Learning Objectives
- Describe multi-task learning and transfer learning
- Recognize bias, variance and data-mismatch by looking at the performances of your algorithm on train/dev/test sets



## Error Analysis

###  Carrying Out Error Analysis

If you're trying to get a learning algorithm to do a task that humans can do. And if your learning algorithm is not yet at the performance of a human. Then manually examining mistakes that your algorithm is making, can give you insights into what to do next. This process is called error analysis.

Error analysis approach:
- get about, say 100 mislabeled dev set examples, 
- Count up how many are dogs
    - if 5 of 100 are dogs then training your classifier to do better on dogs will decrease your error up to 9.5% (called ceiling), which can be too little.
    - if 50 of 100 are dogs then you could decrease your error up to 5%, which is reasonable and you should work on that

> <img src="./images/w02-01-Carrying_Out_Error_Analysis/img_2023-03-31_11-24-33.png">

Sometimes, you can evaluate multiple error analysis ideas in parallel and choose the best idea. 
Create a spreadsheet to do that and decide

For example, clearly in this example, a lot of the mistakes were made on blurry images, and quite a lot on were made on great cat images

> <img src="./images/w02-01-Carrying_Out_Error_Analysis/img_2023-03-31_11-24-35.png">

###  Cleaning Up Incorrectly Labeled Data

Deep learning algorithms are quite robust to **random** errors in the training set

> <img src="./images/w02-02-Cleaning_Up_Incorrectly_Labeled_Data/img_2023-03-31_11-25-03.png">

My advice is, if it makes a significant difference to your ability to evaluate algorithms on your dev set, then go ahead and spend the time to fix incorrect labels. But if it doesn't make a significant difference to your ability to use the dev set to evaluate classifiers, then it might not be the best use of your time

> <img src="./images/w02-02-Cleaning_Up_Incorrectly_Labeled_Data/img_2023-03-31_11-25-06.png">

Guidelines :

> <img src="./images/w02-02-Cleaning_Up_Incorrectly_Labeled_Data/img_2023-03-31_11-25-08.png">

###  Build your First System Quickly, then Iterate


See pdf notes provided by Courseara : [1-Build_System_Quickly.pdf](./1-Build_System_Quickly.pdf)

Depending on the area of application, the guideline below will help you prioritize when you build your
system.

Guideline
1. Set up development/ test set and metrics
    - Set up a target
2. Build an initial system quickly
    - Train training set quickly: Fit the parameters
    - Development set: Tune the parameters
    - Test set: Assess the performance
3. Use Bias/Variance analysis & Error analysis to prioritize next steps

> <img src="./images/w02-03-Build_your_First_System_Quickly_then_Iterate/img_2023-03-31_11-25-27.png">



## Mismatched Training and Dev/Test Set

###  Training and Testing on Different Distributions

See pdf notes provided by Courseara : [2-Training_and_testing_on_different_distributions.pdf](./2-Training_and_testing_on_different_distributions.pdf)

So in this video, we see examples of when allowing your training set data to come from a different distribution than your dev and test set allows you to have much more training data (sometime you cannot avoid working mixing real data and data fron purchase or other...)

First option is to shuffle the data tand extract randomly training and dev/test sets.
- (+) All the sets now come from the same distribution.
- (-) real world distribution that was in the dev/test sets will occur less in the new dev/test sets and that might be not what you want to achieve.

Second option: take some of the dev/test  examples and add them to the training set.
- (+) the distribution important for your application is your targey
- (-) different distributions

First example with cat classifier

> <img src="./images/w02-04-Training_and_Testing_on_Different_Distributions/img_2023-03-31_11-25-47.png">

Second exemple with rearview mirror

> <img src="./images/w02-04-Training_and_Testing_on_Different_Distributions/img_2023-03-31_11-25-50.png">

###  Bias and Variance with Mismatched Data Distributions

See pdf notes provided by Courseara : [3-Bias_and_variance_with_mismatched_data_distributions.pdf](./3-Bias_and_variance_with_mismatched_data_distributions.pdf)

Bias and Variance analysis changes when training and Dev/test set is from the different distribution.

Suppose you've worked in the example and reached this
- Human error: 0%
- Train error: 1%
- Dev error: 10%

With training error is 1%, and dev error is 10% and data data coming from the same distribution, you would say that here you have a large variance problem. But in the setting where your training data and your dev data comes from a different distribution, you can no longer safely draw this conclusion. Maybe there isn't a variance problem and this just reflects that the dev set contains images that are much more difficult to classify accurately.

To solve this issue we create a new set called **train-dev set** as a random subset of the training set (same distribution) 

If you have now :
- Human error: 0%
- Train error: 1%
- **Train-dev error: 9%**
- **Dev error: 10%**

Now we are sure that this is a high variance problem because the gap between train-dev and train errors

Suppose we have a different situation:
- Human error: 0%
- Train error: 1%
- **Train-dev error: 1.5%**
- **Dev error: 10%**

In this case we have **Data mismatch** problem.

> <img src="./images/w02-05-Bias_and_Variance_with_Mismatched_Data_Distributions/img_2023-03-31_11-26-02.png">

The key quantities I would look at are :
1. Human-level error (proxy for Bayes error)
2. Train error
    - Avoidable bias = training error - human level error
3. Train-dev error
    - variance = training-dev error - training error
4. Dev error
    - data mismatch = dev error - train-dev error
5. Test error
    - degree of overfitting to dev set = test error - dev error
    - dev set and test set come from the same distribution
    - so if this difference is big then maybe you need to find a bigger dev set 

> <img src="./images/w02-05-Bias_and_Variance_with_Mismatched_Data_Distributions/img_2023-03-31_11-26-04.png">

In red, the key quantities described above, but other table entries can help in diagnostic too.

> <img src="./images/w02-05-Bias_and_Variance_with_Mismatched_Data_Distributions/img_2023-03-31_11-26-06.png">

###  Addressing Data Mismatch

See pdf notes provided by Courseara : [4-Adressing_data_mismatch.pdf](./4-Adressing_data_mismatch.pdf)

There aren't completely systematic solutions to address data mismatch, but basically :
1. Execute manual error analysis to understand differences between training and dev/test sets.
2. Make training data more similar, or collect more data similar to dev/test sets.

> <img src="./images/w02-06-Addressing_Data_Mismatch/img_2023-03-31_11-26-17.png">

To make training data more similar to dev set one of the techniques is artificial data synthesis

Artificial data synthesis example : combine normal audio with car noise to get audio with car noise example

> <img src="./images/w02-06-Addressing_Data_Mismatch/img_2023-03-31_11-26-19.png">

Artificial data synthesis example : generated car using computer graphics. 

> <img src="./images/w02-06-Addressing_Data_Mismatch/img_2023-03-31_11-26-21.png">

## Learning from Multiple Tasks


###  Transfer Learning

See pdf notes provided by Courseara : [5-Transfer_Learning.pdf](./5-Transfer_Learning.pdf)

Also see [Transfer Learning on Machine Learning Specialization](../../../machine-learning-specialization/c2-advanced-learning-algorithms/week3/#transfer-learning-using-data-from-a-different-task)

Transfer learning refers to using the neural network knowledge for another application.


To do transfer learning:
1. delete the last layer (form task A pretrained model):
2. fine-tuning on task B
    - Option 1: for small data set - keep all the other weights as a fixed weights and learn the new weights
    - Option 2: for enough amount of data,  retrain all the weights.

> <img src="./images/w02-07-Transfer_Learning/img_2023-03-31_11-26-32.png">

When to use transfer learning
- Task A and B have the same input x
- A lot more data for Task A than Task B
- Low level features from Task A could be helpful for Task B

> <img src="./images/w02-07-Transfer_Learning/img_2023-03-31_11-26-33.png">

###  Multi-task Learning

See pdf notes provided by Courseara : [6-Multi_Task_Learning.pdf](./6-Multi_Task_Learning.pdf)

In transfer learning, you have a sequential process where you learn from task A and then transfer that to task B. In multi-task learning, you start off simultaneously, trying to have one neural network do several things at the same time. And then each of these tasks helps hopefully all of the other tasks. 

Multi-task learning refers to having one neural network do simultaneously several tasks.


The vehicle has to detect simultaneously several things: pedestrians, cars, road signs, traffic lights, cyclists

> <img src="./images/w02-08-Multi-task_Learning/img_2023-03-31_11-26-45.png">

> <img src="./images/w02-08-Multi-task_Learning/img_2023-03-31_11-26-47.png">

When to use multi-task learning
- Training on a set of tasks that could benefit from having shared lower-level features
- Usually: Amount of data you have for each task is quite similar
- Can train a big enough neural network to do well on all tasks

> <img src="./images/w02-08-Multi-task_Learning/img_2023-03-31_11-26-48.png">


## End-to-end Deep Learning

###  What is End-to-end Deep Learning?

See pdf notes provided by Courseara : [7-What_is_end_to_end_deep_learning.pdf](./7-What_is_end_to_end_deep_learning.pdf)

Speech recognition system example
```
Audio --> Features --> Phonemes --> Words --> Transcript    # classical system
Audio --------------------------------------> Transcript    # end-to-end deep learning system
```

Mel-frequency cepstral coefficients(MFCC) is the widely used technique for extracting the features from the audio signal.

One interesting sociological effect in AI is that as end-to-end deep learning started to work better, there were some researchers that had spent many years of their career designing individual steps of the pipeline (speech recognition, computer vision, etc), written multiple papers, maybe even built a large part of their career, engineering features or engineering other pieces of the pipeline. And when end-to-end deep learning just took the last training set and learned the function mapping from x and y directly, really bypassing a lot of these intermediate steps, it was challenging for some disciplines to come around to accepting this alternative way of building AI systems.

One of the challenges of end-to-end deep learning is that you might need a lot of data (10'000 or 100'000 hours of audio vs. 3'000 hours for classical pipeline)

If you have a medium amount of data, then there are also intermediate approaches (audio - phonemes - transcript)
```
Audio --> Features --> Phonemes --> Words --> Transcript    
Audio ---------------> Phonemes ------------> Transcript    # intermediate deep learning system
Audio --------------------------------------> Transcript    
```

> <img src="./images/w02-09-What_is_End-to-end_Deep_Learning/img_2023-03-31_11-26-59.png">

Face recognition system

This is a picture of a face recognition turnstile built by a researcher, Yuanqing Lin at Baidu, where this is a camera and it looks at the person approaching the gate, and if it recognizes the person then, you know the turnstile automatically lets them through.

Researchers have found  that instead of trying to learn everything on one step, by breaking this problem down into two simpler steps, first is figure out where is the face and second figure out who this actually is, allows the learning algorithm to split into two learning algorithms to solve two much simpler tasks and results in overall better performance. 

```
Image ---------------------> Face recognition   
Image --> Face detection --> Face recognition
```
The two step approach works better for two reasons
- each of the two problems you're solving is actually much simpler
- you have a lot of data for each of the two sub-tasks, in particular for first step (face detection). 

> <img src="./images/w02-09-What_is_End-to-end_Deep_Learning/img_2023-03-31_11-27-01.png">

Two more examples: 
- Machine translation system, working because today we have a lot of data with english and french corresponding sentences
- Estimating child's age from the x-ray picture of a hand (end-to-end doesn't work because data is missing)


> <img src="./images/w02-09-What_is_End-to-end_Deep_Learning/img_2023-03-31_11-27-03.png">

###  Whether to use End-to-end Deep Learning

See pdf notes provided by Courseara : [8-Whether_to_use_end_to_end_deep_learning.pdf](./8-Whether_to_use_end_to_end_deep_learning.pdf)

Before applying end-to-end deep learning, you need to ask yourself the following question: Do you have
enough data to learn a function of the complexity needed to map x and y?

Pro:
- Let the data speak
    - By having a pure machine learning approach, the neural network will learn from x to y. It will
    be able to find which statistics are in the data, rather than being forced to reflect human
    preconceptions.
- Less hand-designing of components needed
    - It simplifies the design work flow.

Cons:
- Large amount of labeled data
    - It cannot be used for every problem as it needs a lot of labeled data.
- Excludes potentially useful hand-designed component
    - Data and any hand-design’s components or features are the 2 main sources of knowledge for a learning algorithm. If the data set is small than a hand-design system is a way to give manual knowledge into the algorithm.

> <img src="./images/w02-10-Whether_to_use_End-to-end_Deep_Learning/img_2023-03-31_11-27-14.png">

Do you have enough data for end-to-end Deep Learning?

So let me finish this video with a more complex example. You may know that I've been spending time helping out an autonomous driving company, Drive.ai. So I'm actually very excited about autonomous driving. So how do you build a car that drives itself? 

So I think what this example illustrates is that you want to use machine learning or use deep learning to learn some individual components and when applying supervised learning you should carefully choose what types of X to Y mappings you want to learn depending on what task you can get data for. And in contrast, it is exciting to talk about a pure end-to-end deep learning approach where you input an image and directly output a steering. But given data availability and the types of things we can learn with neural networks today, this is actually not the most promising approach or this is not an approach that I think teams have gotten to work best.

> <img src="./images/w02-10-Whether_to_use_End-to-end_Deep_Learning/img_2023-03-31_11-27-16.png">

## Heroes of Deep Learning (Optional)

###  Ruslan Salakhutdinov Interview
