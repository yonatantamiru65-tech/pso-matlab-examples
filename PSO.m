clc;
clear;
close all; 

%% problem definition 

 % objective of function we want to minimize 
CostFunction = @(x) sphereFunction(x);  % The "Objective" Function
nVar = 10;                      % Number of Decision Variables
VarSize = [1 nVar];             % Matrix Size (1 row, 10 columns)
VarMin = -0.5;                   % Lower Bound (Lake Edge)
VarMax = 0.5;                    % Upper Bound (Lake Edge)


%% PSO Parameters

MaxIt = 1000;      % Maximum Number of Iterations
nPop = 50;        % Population Size (Swarm Size)

% Constriction Coefficients (From Video 3)
% phi1 = 2;
% phi2 = 2;
% phi = phi1 + phi2;
% chi = 2 / abs(2 - phi - sqrt(phi^2 - 4*phi)); % The "Chi" Factor
% 
% w = chi;          % Inertia Weight
% c1 = chi * phi1;  % Personal Learning Coefficient
% c2 = chi * phi2;  % Global Learning Coefficient
w = 1;          % Inertia Weight
wdamp = 0.99; 
c1 = 2;  % Personal Learning Coefficient
c2 = 2;
%% initialization

empty_particle.Position = [];
empty_particle.Velocity = [];
empty_particle.Cost = [];
empty_particle.Best.Position = [];
empty_particle.Best.Cost = [];

particle = repmat(empty_particle, nPop, 1);

GlobalBest.Cost = inf; % Initialize to infinity (worst possible)

for i = 1:nPop
    % Generate Random Solution
    particle(i).Position = unifrnd(VarMin, VarMax, VarSize);
    
    % Initialize Velocity to 0
    particle(i).Velocity = zeros(VarSize);
    
    % Evaluation
    particle(i).Cost = CostFunction(particle(i).Position);
    
    % Update Personal Best
    particle(i).Best.Position = particle(i).Position;
    particle(i).Best.Cost = particle(i).Cost;
    
    % Update Global Best
    if particle(i).Best.Cost < GlobalBest.Cost
        GlobalBest = particle(i).Best;
    end
end

%% PSO Main Loop

for it = 1:MaxIt
    
    for i = 1:nPop

        
    % Update Velocity
        particle(i).Velocity = w * particle(i).Velocity ...
            + c1 * rand(VarSize) .* (particle(i).Best.Position - particle(i).Position) ...
            + c2 * rand(VarSize) .* (GlobalBest.Position - particle(i).Position);
            % Apply Velocity Limits
        particle(i).Velocity = max(particle(i).Velocity, VelMin);
        particle(i).Velocity = min(particle(i).Velocity, VelMax);
    % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        
            % Velocity Mirroring (Boundary Control)
        isOutside = particle(i).Position < VarMin | particle(i).Position > VarMax;
        particle(i).Velocity(isOutside) = -particle(i).Velocity(isOutside);
        
            % Position Clamping
        particle(i).Position = max(particle(i).Position, VarMin);
        particle(i).Position = min(particle(i).Position, VarMax);
        
   % Update Personal Best
        if particle(i).Cost < particle(i).Best.Cost
            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;
            
            % Update Global Best
            if particle(i).Best.Cost < GlobalBest.Cost
                GlobalBest = particle(i).Best;
            end
        end
    end
% Store Best Cost
    BestCost(it) = GlobalBest.Cost;
    
    % Display Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    w = w * wdamp;
end

%% Results
figure;
semilogy(BestCost, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;

