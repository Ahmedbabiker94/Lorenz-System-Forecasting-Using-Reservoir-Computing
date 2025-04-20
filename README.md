# Lorenz-System-Forecasting-Using-Reservoir-Computing
This project demonstrates the application of a Reservoir Computing model (specifically, an Echo State Network) to learn and forecast the behavior of the Lorenz system, a well-known chaotic dynamical system.
The model is trained to predict the y component of the Lorenz attractor using only the x component as input, showcasing the power of reservoir computing in modeling nonlinear, chaotic systems.

Workflow Overview
1. Lorenz System Simulation
The Lorenz system is defined using the classical parameters:
σ = 10, β = 8/3, and ρ = 28.

The system is simulated using Euler integration over 10,000 time steps with a step size of dt = 0.01.

Initial conditions: x0 = y0 = z0 = 1.

The system evolves according to its differential equations, and the time series for x, y, and z is generated.

2. Reservoir Computing Setup
A random recurrent neural network (reservoir) with:

reservoir_size = 500 neurons

input_scaling = 0.1 (scales input to the reservoir)

spectral_radius = 0.95 (ensures the reservoir’s echo state property)

leak_rate = 0.3 (controls the memory decay in the system)

The system is trained on 80% of the time series and tested on the remaining 20%.

3. Training Phase
The x values are fed into the reservoir at each time step.

Internal states of the reservoir are updated using a leaky integration of the previous state and new input.

The reservoir states are collected over the training period.

A simple ridge regression (L2-regularized least squares) is used to compute output weights W_out that map reservoir states to the target output (y_train).

4. Testing Phase
The trained output weights are used to generate predictions for the y variable using x_test as input to the reservoir.

Predictions are made in a feedforward fashion without retraining.

5. Evaluation
The model's performance is evaluated using Root Mean Square Error (RMSE) between predicted and actual y values.

A plot is generated comparing the predicted y trajectory against the true y trajectory over time.

Technologies Used:

Python

NumPy

SciPy

Matplotlib

Reservoir Computing (Echo State Networks)

