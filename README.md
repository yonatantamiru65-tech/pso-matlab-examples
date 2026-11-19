# Particle Swarm Optimization in MATLAB

MATLAB learning examples that minimize the Sphere function using Particle Swarm Optimization (PSO), with swarm initialization, velocity updates, boundary handling and convergence plots.

## Examples at a glance

| Script | Configuration | Approach |
| --- | --- | --- |
| `pso_1.m` | 100 variables, 100 particles, 1,000 iterations; bounds [-1, 1] | Constriction coefficients, velocity limits, boundary mirroring and position clamping |
| `PSO.m` | 10 variables, 50 particles, 1,000 iterations; bounds [-0.5, 0.5] | Earlier inertia-weight example with damping |
| `sphereFunction.m` | Objective: sum of squared coordinates | Shared benchmark function, with minimum 0 at the origin |

## Getting started

1. Download or clone this repository.
2. Open the project directory in MATLAB.
3. Run `pso_1` from the Command Window.

The script prints the best objective value at each iteration and plots the convergence history on a logarithmic scale. Results vary between runs because initialization and updates are random.

**Requirements:** MATLAB and Statistics and Machine Learning Toolbox (`unifrnd` is used for initialization).

## Status and limitations

These are learning examples supplied by Yonatan Tamiru Asfaw. The original MATLAB source files are preserved unchanged and have not been executed during repository preparation.

Start with `pso_1.m`. The earlier `PSO.m` draft references undefined `VelMin` and `VelMax` variables and does not re-evaluate the objective after moving particles; it needs correction before use.

Editor autosaves (`.asv`) and a saved third-party HTML page from the source archive are omitted. No new software license has been assigned.
