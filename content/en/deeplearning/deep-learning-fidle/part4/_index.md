---
type: docs
title: "04. PyTorch"
---


## Seq 07 :  Un détour par PyTorch


### DNN - Define and compile the model 

#### Keras - sequential API

```python

import tensorflow as tf
from tensorflow import keras

hidden1     = 100
hidden2     = 100

model = keras.Sequential([
    keras.layers.Input((28,28)),
    keras.layers.Flatten(),
    keras.layers.Dense( hidden1, activation='relu'),
    keras.layers.Dense( hidden2, activation='relu'),
    keras.layers.Dense( 10,      activation='softmax')
])

model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])
```

#### Tensorflow Functional API

```python
import tensorflow as tf
from tensorflow import keras

hidden1 = 100
hidden2 = 100

# Define the input layer
input_layer = keras.layers.Input(shape=(28, 28))

# Flatten the input
flattened = keras.layers.Flatten()(input_layer)

# Hidden layers
hidden_layer1 = keras.layers.Dense(hidden1, activation='relu')(flattened)
hidden_layer2 = keras.layers.Dense(hidden2, activation='relu')(hidden_layer1)

# Output layer
output_layer = keras.layers.Dense(10, activation='softmax')(hidden_layer2)

# Create the model
model = keras.models.Model(inputs=input_layer, outputs=output_layer)

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

```


#### PyTorch


```python
import torch
import torch.nn as nn


class CustomModel(nn.Module):
    def __init__(self):
        hidden1 = 100
        hidden2 = 100
        super(CustomModel, self).__init__()
        self.flatten = nn.Flatten()
        self.fc1 = nn.Linear(28 * 28, hidden1)
        self.fc2 = nn.Linear(hidden1, hidden2)
        self.fc3 = nn.Linear(hidden2, 10)
    
    def forward(self, x):
        x = self.flatten(x)
        x = torch.relu(self.fc1(x))
        x = torch.relu(self.fc2(x))
        x = torch.softmax(self.fc3(x), dim=1)
        return x

model = CustomModel()
loss = nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.001)
```

### DNN - Fit the model

#### Keras
```python
# Train the model
model.fit(
    x_train,
    y_train,
    epochs=10,
    batch_size=32,
    validation_data=(x_val, y_val)
)
```

#### PyTorch

```python
import torch
import torch.nn as nn
import torch.optim as optim

# Assuming you have defined your model architecture as CustomModel
model = CustomModel()

loss = nn.CrossEntropyLoss()  
optimizer = optim.Adam(model.parameters(), lr=0.001)

# Training loop
for epoch in range(10):
    model.train()  # Set the model in training mode
    for inputs, targets in train_loader:  # Assuming you have a DataLoader
        optimizer.zero_grad()
        outputs = model(inputs)
        loss_value = loss(outputs, targets)     
        loss_value.backward()
        optimizer.step()

    # Validation loop (similar to training loop)
    model.eval()  # Set the model in evaluation mode
    with torch.no_grad():
        total_correct = 0
        total_samples = 0
        for inputs, targets in val_loader:  # Assuming you have a DataLoader
            outputs = model(inputs)
            _, predicted = torch.max(outputs, 1)
            total_samples += targets.size(0)
            total_correct += (predicted == targets).sum().item()

        validation_accuracy = total_correct / total_samples
        print(f"Epoch [{epoch+1}/10], Validation Accuracy: {validation_accuracy:.4f}")


```


### PyTorch - Tensor

```python
import torch
import numpy as np

# Create a 1D tensor (vector)
tensor_1d = torch.tensor([1, 2, 3, 4, 5])
array_1d = np.array([1, 2, 3, 4, 5])

# Create a 2D tensor (matrix)
tensor_2d = torch.tensor([[1, 2, 3], [4, 5, 6]])
array_2d = np.array([[1, 2, 3], [4, 5, 6]])

```

```python
import torch

# 1. Transpose
tensor_transpose = torch.tensor([[1, 2, 3],
                                 [4, 5, 6]])
transposed_tensor = tensor_transpose.transpose(0, 1)
print(transposed_tensor)
# Output: tensor([[1, 4],
#                 [2, 5],
#                 [3, 6]])

# 2. Shape
tensor_shape = torch.tensor([[1, 2, 3],
                             [4, 5, 6]])
print(tensor_shape.shape)
# Output: torch.Size([2, 3])

# 3. Reshape
tensor_reshape = torch.tensor([1, 2, 3, 4, 5, 6])
reshaped_tensor = tensor_reshape.reshape(2, 3)
print(reshaped_tensor)
# Output: tensor([[1, 2, 3],
#                 [4, 5, 6]])

# 4. randint
random_ints = torch.randint(0, 10, size=(3, 3))
print(random_ints)
# Output: tensor([[5, 0, 4],
#                 [0, 8, 5],
#                 [2, 1, 7]])

# 5. View
tensor_view = torch.tensor([1, 2, 3, 4, 5, 6])
reshaped_view_tensor = tensor_view.view(2, 3)
print(reshaped_view_tensor)
# Output: tensor([[1, 2, 3],
#                 [4, 5, 6]])

# 6. Flatten
tensor_flatten = torch.tensor([[1, 2, 3],
                               [4, 5, 6]])
flattened_tensor = tensor_flatten.flatten()
print(flattened_tensor)
# Output: tensor([1, 2, 3, 4, 5, 6])

```


### Automatic differentiation

In mathematics and computer algebra, [automatic differentiation](https://en.wikipedia.org/wiki/Automatic_differentiation) (auto-differentiation, autodiff, or AD), also called algorithmic differentiation, computational differentiation,[1][2] is a set of techniques to evaluate the partial derivative of a function specified by a computer program.

Cf. [Back propagation](/deeplearning/machine-learning-specialization/c2-advanced-learning-algorithms/week2/#back-propagation-optional)

#### Tensorflow
```python
import tensorflow as tf
from tensorflow import keras

# Define a variable with an initial value using Keras backend
x = tf.Variable(3.0)

# Define a function using the variable
def func(x):
    return x**2 + 2*x + 1

# Use GradientTape from Keras to compute the gradient
with tf.GradientTape() as tape:
    y = func(x)
    
dy_dx = tape.gradient(y, x)
print("Gradient:", dy_dx.numpy())  
# Derivative is 2*x + 2, x= 3, Gradient: 8.0
```

#### PyTorch
```python
import torch

# Define a tensor with requires_grad=True
x = torch.tensor(3.0, requires_grad=True)

# Define a function using the tensor
def func(x):
    return x**2 + 2*x + 1

# Compute the gradient using backward()
y = func(x)
y.backward()

dy_dx = x.grad
print("Gradient:", dy_dx.item())  s
# Derivative is 2*x + 2, x= 3, Gradient: 8.0
```

### GPU

#### Tensorflow

```python
import tensorflow as tf

# Check if GPU is available
gpu_available = tf.config.list_physical_devices('GPU')

if gpu_available:
    print("Number of GPUs available:", len(gpu_available))
    for gpu in gpu_available:
        print("GPU Name:", gpu.name)
else:
    print("No GPUs available.")
```

```python
import tensorflow as tf
import time

# Create random matrices
matrix_size = 1000
matrix_a = tf.random.normal((matrix_size, matrix_size))
matrix_b = tf.random.normal((matrix_size, matrix_size))

# CPU computation
start_time = time.time()
result_cpu = tf.matmul(matrix_a, matrix_b)
cpu_time = time.time() - start_time

# GPU computation (if available)
if tf.config.list_physical_devices('GPU'):
    with tf.device('GPU'):
        start_time = time.time()
        result_gpu = tf.matmul(matrix_a, matrix_b)
    gpu_time = time.time() - start_time

print("CPU Time:", cpu_time)
if tf.config.list_physical_devices('GPU'):
    print("GPU Time:", gpu_time)

```

#### Pytorch

```python
import torch

# Check if GPU is available
gpu_available = torch.cuda.is_available()

if gpu_available:
    num_gpus = torch.cuda.device_count()
    print("Number of GPUs available:", num_gpus)
    for i in range(num_gpus):
        print("GPU Name:", torch.cuda.get_device_name(i))
else:
    print("No GPUs available.")

```

```python
import torch
import time

# Create random tensors
matrix_size = 1000
matrix_a = torch.randn((matrix_size, matrix_size))
matrix_b = torch.randn((matrix_size, matrix_size))

# CPU computation
start_time = time.time()
result_cpu = torch.mm(matrix_a, matrix_b)
cpu_time = time.time() - start_time

# GPU computation (if available)
if torch.cuda.is_available():
    device = torch.device('cuda')
    matrix_a = matrix_a.to(device)
    matrix_b = matrix_b.to(device)
    start_time = time.time()
    result_gpu = torch.mm(matrix_a, matrix_b)
    gpu_time = time.time() - start_time

print("CPU Time:", cpu_time)
if torch.cuda.is_available():
    print("GPU Time:", gpu_time)
```


### 

#### Tensorflow

```python
```

#### Pytorch

```python
```







<!-- 

## Seq 08 :  "Attention Is All You Need", quand les Transformers changent la donne (HB,NC)

## Seq 09 :  Travailler avec des données structurées : Graph Neural Network(GNN)

## Seq 10 : Autoencodeur (AE) : un exemple d'apprentissage "self supervised"

## Seq 11 : Variational Autoencoder (VAE) : apprentissage "self supervised"

## Seq 12 : Revue de projets Fidle Intégrée à la future journée Deep Learning pour la Science

## Seq 13 : Generative Adversarial Networks (GAN)!

## Seq 14 : Diffusion model, text to image (HB,NC,MS)

## Seq 15 -  AI, droit, société et éthique (LR, BC, ...)

## Seq 16 : Apprendre plus vite et moins cher, optimiser l’apprentissage (BC,LH)

## Seq 17 :  Passer à la vitesse supérieure : l’accélération matérielle (BC,LH)

## Seq 18 :  Tactiques et stratégies du Deep Reinforcement Learning

## Seq 19 :  Des neurones pour la physique, les physics-informed neural networks (PINNS)

## Seq 20 :  Journée Deep Learning pour la Science - JDLS2023 -->
