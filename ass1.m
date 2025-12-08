% =========================================================================
% SCRIPT: Structural VAR Analysis (Cholesky Identification)
% AUTHOR: Luca Orlando
%
% DESCRIPTION:
% This script performs a structural analysis of the US economy using
% quarterly data. The workflow includes:
% 1. Data Loading: Imports macroeconomic variables from Excel.
% 2. Ordering: Reorders variables to enforce a specific recursive structure
%    (Wold ordering) required for Cholesky identification.
% 3. Estimation: Estimates a Reduced Form VAR with 4 lags using OLS
%    (implemented via 'rfvar3' with Flat Prior settings).
% 4. Identification: Recovers structural shocks using Cholesky decomposition
%    of the covariance matrix.
% 5. IRF Analysis: Computes and plots the Impulse Response Functions (IRF)
%    to visualize the dynamic effects of specific shocks.
% =========================================================================

clear;
clc;
addpath('/Users/lucaorlando/Desktop/BVAR_-master/bvartools');
addpath('/Users/lucaorlando/Desktop/BVAR_-master/cmintools');
file = '/Users/lucaorlando/Desktop/Structural /ps1/BCF_USquarterlydata.xlsx';
T   = readtable(file);                     
% all variables are numeric
isNumVar   = varfun(@isnumeric, T, 'OutputFormat','uniform');
Y_all      = T{:, isNumVar};
var_names  = T.Properties.VariableNames(isNumVar);

% sort according to your model
perm = [4 1 2 3 5 6 7];
Y = Y_all(:, perm);
var_names = var_names(perm);

%% Specification
lags   = 4;
xdata  = [];
breaks = [];
lambda = 0;
mu     = 0;

%% Estimation of reduced form
VAR = rfvar3(Y, lags, xdata, breaks, lambda, mu);
B     = VAR.B;
u     = VAR.u;
Sigma = cov(u);
N = size(Y,2);
alpha = B(1:N*lags, :);

%Cholesky identification
Omega = eye(N);
Q = chol(Sigma, 'lower');

%% IRF
hor = 34;
ir = iresponse(alpha, Sigma, hor, Omega, 1);
i = 5;   % variable
j = 6;   % shock
figure;
plot(0:hor-1, squeeze(ir(i,:,j)), 'LineWidth', 1.2);
grid on;
xlabel('Horizon');
ylabel(var_names{i}, 'Interpreter','none');
title(['IRF: ' var_names{i} ' risposta a shock su ' var_names{j}], ...
      'Interpreter','none');