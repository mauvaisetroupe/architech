---
type: docs
title: "W3 - Object Detection"
description: "Apply your new knowledge of CNNs to one of the hottest (and most challenging!) fields in computer vision: object detection."

---


Apply your new knowledge of CNNs to one of the hottest (and most challenging!) fields in computer vision: object detection.

Learning Objectives
- Identify the components used for object detection (landmark, anchor, bounding box, grid, ...) and their purpose
- Implement object detection
- Implement non-max suppression to increase accuracy
- Implement intersection over union
- Handle bounding boxes, a type of image annotation popular in deep learning
- Apply sparse categorical crossentropy for pixelwise prediction
- Implement semantic image segmentation on the CARLA self-driving car dataset
- Explain the difference between a regular CNN and a U-net
- Build a U-Net



## Detection Algorithms

### Object Localization

Different algorithms :
- Classification: is there a car, yes, no?
- Classification with localization: is there a car + drawing a bouding box
- Detection : multiple objects, detect and localize cars, but also pedestrian, etc... so multiple objects in different categories

> <img src="./images/w03-01-object_localization/img_2023-04-10_09-15-30.png">

- We already seen classification during [week1](../week1/ and [week2](../week2/ and the result is a vector fed by a softmax function with predicted categories (or classes).
- We add 4 numbers(bx, by, bh and bw) that define localization rectangle

By convention, we define
- coordinates (0,0) in upper left of the image
- coordinates (1,1) in the lower right corner of the image
bx, by are the coordinates of the center of the red rectangle

> <img src="./images/w03-01-object_localization/img_2023-04-10_09-15-33.png">

The ouput y contains :
- Pc, probability there is an object
- bx, by, bh, bw, the localization
- c1, c2, c3 tell you the class of the object (if Pc = 1)

Note that :
- with the squared error, loss function definition differs if (y1=0)
- squard error is use here to simplify explainantion, but we can mix squared error and logistic regression loss (for c1, c2, c3)

> <img src="./images/w03-01-object_localization/img_2023-04-10_09-15-35.png">

### Landmark Detection

To implement object localization, idea of usear real numbers (rectnagle position and size) is a powerful idea. Landmark detection is the generalization of this idea.

Two examples :
- Face recognition :
   - for emotion recognition
   - for snapshat filters and Augmented Reality
- People pose detection

We need obviously labeled images including boring landmarks on the images, that must be consistence accross all images (mouth, nose, eyes, etc...). You need hire labelers..

> <img src="./images/w03-02-landmark_detection/img_2023-04-10_09-15-53.png">

### Object Detection

1. create a training set with cars (cropped image with only the car in the image)
2. train ConvNet with the cropped images
3. Use a *sliding windows detection*.

> <img src="./images/w03-03-object_detection/img_2023-04-10_09-16-11.png">

Algorithm:
1. Pick a window size and a stride
2. Iterate on the image until all the image is covered:
   - split your image into a rectangle
   - feed the image into the Conv net and decide if its a car or not
   - shift the windows
3. Pick larger rectangles and repeat the process 2.

Disadvantages :
- Computational cost is really bad (so many rectagles to pass to ConvNet) and
- unless rectangle and stide are really small, accuracy is not good.

> <img src="./images/w03-03-object_detection/img_2023-04-10_09-16-15.png">

### Convolutional Implementation of Sliding Windows

We've just see that sliding widows algorithm is too slow with bad computational cost. Let's see how to implement it *convolutionnaly*.

We can replace the 2 FC (fully connected) layers by convolutional layers. It's mathematically equivalent.

Not demonstrated in the video, but intuition is about the number of operations (multiplications):
- FC layer #1 :
   - FC : input activation (5x5x16) is flattened to a 1x400 vector, and fully connected to 400 units, so 400*400 = 160'000 operation
   - 5x5x16 CONV : for each filter, 5x5x16=400 operations and we take 400 filters, total 400*400 = 160'000 operation
- FC layer #2:
   - FC : 400 * 400
   - 1x1x400 CONV : 400 filters, each filter 1*1*400, total 400*400

> <img src="./images/w03-04-convolutional_implementation_of_sliding_windows/img_2023-04-10_09-16-34.png">

The convolutional window allows the share a lot of computation between these 4 ConvNet processing:

> <img src="./images/w03-04-convolutional_implementation_of_sliding_windows/img_2023-04-10_09-16-37.png">


##### 14x14x3 image, base image for sliding algorithm

> <img src="./images/w03-04-convolutional_implementation_of_sliding_windows/20.png">

- ConvNet for a picture 14x14x3 (the size of our sliding window in the example)
- to simplify the drawing for this slide, I'm just going to draw the front face of this volume. 

##### 16x16x3 image, 4 sliding windows

> <img src="./images/w03-04-convolutional_implementation_of_sliding_windows/21.png">

If applying sliding standard algorithm for a 16x16x3 images, we run ConvNet 4 times in the original algorithm
- input blue rewgion into ConvNet
- we use a stride of 2 pixel to the right (green reactangle)
- orange region into the ConvNet
- purple square into ConvNet

Instead, we run convolutional alorithme
- we run *the same* 5x5x3 filters (16 filters) than for the 14x14x3 image, now we obtain a 12x12x16 output volume
- we run the same 2x2 MAX POOL
- etc..

It trurns out that each pixel ou the output corresponds to the windows positions.
Example for the green ractangle

##### Other example
> <img src="./images/w03-04-convolutional_implementation_of_sliding_windows/22.png">

Same explanation on a bigger image

##### Conclusion

- we have impented the sliding windows algorith using only convolutional layers that allow to share a lot of computation and so to decrease the computational cost
- We haven't yet tackle the scond issue : the bouding box accuracy

> <img src="./images/w03-04-convolutional_implementation_of_sliding_windows/img_2023-04-10_09-16-39.png">

### Bounding Box Predictions

In the following example, none of the sliding windows match the perfect bounding box.

> <img src="./images/w03-05-bounding_box_predictions/img_2023-04-10_09-16-52.png">

A good way to increase accuracy is using YOLO algorithm (You Only Look Once)
- Define a grid. For pupose of illustration, we use a 3x3 grid (in reality, we will use a finer one like 19x19)
- Prepare the training set defining for each cell of the gris the 8-dimension vecor defined in the [classification and localization algorithm](#object-localization) to each of the 9 cells of the grid.
   - assign the object to the grid that contain the center of the bouding box
- Train the model :
   - The input is a 100x100x3 image
   - The output is a 3x3x8 volume (3x3 for the grid, 8 for the vector)
   - Use a usual ConvNet

Notes :
- This algorithm works fine as long as you have maximum one object by cell. You can reduce the chance to have multiple object sing a finer grid (19x19)
- it's a convolutional implementation of the algorithm (with a lot of share computation, we don't run 19*x*19=161 times the same algorithm)
> <img src="./images/w03-05-bounding_box_predictions/img_2023-04-10_09-16-54.png">

Detail on how we encode bouding boxes (already discussed)
- coordinates (0,0) in upper left of the image
- coordinates (1,1) in the lower right corner of the image bx, by are the coordinates of the center of the red rectangle

> <img src="./images/w03-05-bounding_box_predictions/img_2023-04-10_09-16-56.png">

Warning : Yolo is a very hard paper to read.

### Intersection Over Union

How do you tell if your object detection algorithm is working well? Intersection Over Union (IOU) measure the overlap between 2 bounding boxes.

Usually, IOU > 0.5 means a correct martching between the 2 boxes

> <img src="./images/w03-06-intersection_over_union/img_2023-04-10_09-17-13.png">

### Non-max Suppression

<!--
> <img src="./images/w03-07-non-max_suppression/img_2023-04-10_09-17-33.png">
> <img src="./images/w03-07-non-max_suppression/img_2023-04-10_09-17-35.png">
-->

One of the problems of Object Detection is that your algorithm may find multiple detections of the same objects

Each car has multiple detections with different probabilities that come from the fact that many grids consider they have the center point of the object.

> <img src="./images/w03-07-non-max_suppression/img_2023-04-10_09-17-37.png">

Idea is to:
- take box with highest probabilities, 
- iterate over other boxes and elliminate the ones with high IOU

If classes are used for multiple classes of objects, the compare only boxes with same class

> <img src="./images/w03-07-non-max_suppression/img_2023-04-10_09-17-40.png">

### Anchor Boxes

One of the problems with object detection as you have seen it so far is that each of the grid cells can detect only one object. What if a grid cell wants to detect multiple objects? 

And for this example, I am going to continue to use a 3 by 3 grid. Notice that the midpoint of the pedestrian and the midpoint of the car are in almost the same place and both of them fall into the same grid cell

In output y : 
- the first part is associated to anchor #1
- the second par is associated to anchor #2

> <img src="./images/w03-08-anchor_boxes/img_2023-04-10_09-17-55.png">

- Without anchor, output is 3x3x8 (3x3 for grid, 8 for vecctor with detection and position)
- With anchor,  output is 3x3x16 = 3x3x(2*8) (2 anchors)

> <img src="./images/w03-08-anchor_boxes/img_2023-04-10_09-17-57.png">

Concrete example, with class c1 = pedestrian, c2 = car

> <img src="./images/w03-08-anchor_boxes/img_2023-04-10_09-17-59.png">

Algorithm doesn't handle :
- two anchor boxes but three objects in the same grid cell
- two objects associated with the same grid cell, but both of them have the same anchor box shape

Anchor boxes are used if two objects appear in the same grid cell. In practice, that happens quite rarely, especially if you use a 19 by 19 rather than a 3 by 3 grid. Another motivation is that it allows your learning algorithm to specialize better. In particular, if your data set has some tall, skinny objects like pedestrians, and some wide objects like cars.

Finally, how do you choose the anchor boxes? 
- choose them by hand or choose maybe five or 10 anchor box shapes that spans a variety of shapes that seems to cover the types of objects you seem to detect
- more advanced version, an even better way to do this in one of the later YOLO research papers, is to use a K-means algorithm, to group together two types of objects shapes you tend to get

### YOLO Algorithm

> <img src="./images/w03-09-yolo_algorithm/img_2023-04-10_09-18-14.png">
> <img src="./images/w03-09-yolo_algorithm/img_2023-04-10_09-18-16.png">
> <img src="./images/w03-09-yolo_algorithm/img_2023-04-10_09-18-18.png">

### Region Proposals (Optional)

> <img src="./images/w03-10-region_proposals/img_2023-04-10_09-18-35.png">

Andrew : "So the idea of region proposals has been quite influential in computer vision, and I wanted you to know about these ideas because you see others still used these ideas, for myself, and this is my personal opinion, not the opinion of the computer vision research committee as a whole. I think that we can propose an interesting idea but that not having two steps, first, proposed region and then crossfire, being able to do everything more or at the same time, similar to the YOLO or the You Only Look Once algorithm that seems to me like a more promising direction for the long term"

> <img src="./images/w03-10-region_proposals/img_2023-04-10_09-18-37.png">

### Semantic Segmentation with U-Net


Let's say you're building a self-driving car:
- detect the position of the other cars. with bounding box is enough
- but detecting the road and trying to draw a bounding box around the roads is not useful. You want to label every single pixel as a drivable roads or not (dark green).

> <img src="./images/w03-11-semantic_segmentation_with_u-net/img_2023-04-10_09-18-58.png">

These are a couple of images from research papers by Novikov et al and by Dong et al. In medical imaging, given a chest X-ray, you may want to diagnose if someone has a certain condition, but what may be even more helpful to doctors, is if you can segment out in the image, exactly which pixels correspond to certain parts of the patient's anatomy. In the image on the left, the lungs, the heart, and the clavicle, so the collarbones are segmented out using different colors

> <img src="./images/w03-11-semantic_segmentation_with_u-net/img_2023-04-10_09-19-00.png">

Let's say for now that the only thing you care about is segmenting out the car in this image. In that case, you may decide to have two cause labels. 

> <img src="./images/w03-11-semantic_segmentation_with_u-net/img_2023-04-10_09-19-02.png">

With 3 classes : car, building and road.

> <img src="./images/w03-11-semantic_segmentation_with_u-net/img_2023-04-10_09-19-05.png">

What's the right neural network architecture to do that? 
- Let's start with the object recognition neural network architecture that you're familiar with 
- let's get rid of the last few layers 
- the image have been generally getting smaller as we go from left to right, it now needs to get bigger so they can gradually blow it back up to a full-size image
- it now needs to get bigger so they can gradually blow it back up to a full-size image,

To make the image bigger you have to know how to implement a **transpose convolution**.

> <img src="./images/w03-11-semantic_segmentation_with_u-net/img_2023-04-10_09-19-07.png">

### Transpose Convolutions

Normal vs Transpose Convolutions

(output of mormal convulution has 5 channels so we need 5 filters)

> <img src="./images/w03-12-transpose_convolutions/img_2023-04-10_09-19-09.png">

In the transpose convolution, instead of placing the filter on the input, you would instead place a filter on the output. 

<!-- <img src="./images/w03-12-transpose_convolutions/img_2023-04-10_09-19-11.png">-->

Exemple with :
- filter 3x3
- padding p=1
- stride s=2

First pixel:

> <img src="./images/w03-12-transpose_convolutions/01.png">

Second pixel, s=2

> <img src="./images/w03-12-transpose_convolutions/02.png">

Pixel #3

> <img src="./images/w03-12-transpose_convolutions/03.png">

Pixel #4

> <img src="./images/w03-12-transpose_convolutions/04.png">

### U-Net Architecture Intuition

- we use normal convolutions for the first part of the neural network that compress the image
   - you've lost a lot of spatial information because the dimension is much smaller, 
   - but it's much deeper. So, for example, this middle layer may represent that looks like there's a cat roughly in the lower right hand portion of the image
- the second half of this neural network uses the transports convolution to blow the representation size up back to the size of the original input image
- we use a skip connection 
   - earlier block of activations is copied directly to this later block 
   - that's give a very detailed, fine grained spatial information lost in the network that give high level contextual information

> <img src="./images/w03-13-u-net_architecture_intuition/img_2023-04-10_09-19-14.png">

### U-Net Architecture

This is what a U-Net looks like. By the way, is also why it's called a U-Net, because when you draw it like this, it looks a lot like a U.

> <img src="./images/w03-14-u-net_architecture/img_2023-04-10_09-19-15.png">
