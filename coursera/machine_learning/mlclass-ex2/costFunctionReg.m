function [J, grad] = costFunctionReg(theta, X, y, lambda)

% COSTFUNCTIONREG Compute cost and gradient for logistic
% regression with regularization
% J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of
% using theta as the parameter for regularized logistic 
% regression and the gradient of the cost w.r.t. to the
% parameters. 

m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
% You should set J to the cost. Compute the partial derivatives 
% and set grad to the partial derivatives of the cost w.r.t. each 
% parameter in theta

%regularization vector to ommit theta 0

h = sigmoid(X*theta);

initial_cost = (-(y'*log(h) + (1-y)'*log(1-h)) / m);
reg_cost = (lambda * sum(theta(2:end).^2)/(2*m));

J = initial_cost + reg_cost;

% Depending on the dimensions of the vectors below, you need to 
% add or dot product the gradient and the regularization

initial_grad = ((h-y)' * X) / m;	
reg_grad = (lambda * theta(2:end)/m);

grad = initial_grad + [0 ; reg_grad]';

% =============================================================

end