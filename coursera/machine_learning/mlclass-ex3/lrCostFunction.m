function [J, grad] = lrCostFunction(theta, X, y, lambda)
% LRCOSTFUNCTION Compute cost and gradient for logistic
% regression with regularization

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
% You should set J to the cost.
% Compute the partial derivatives and set grad to the partial
% Hint: The computation of the cost function and gradients can
% be efficiently vectorized. For example, consider the
% computation
%
%           sigmoid(X * theta)
%
% Each row of the resulting matrix will contain the value of the prediction for that example. You can make use of this to vectorize the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, there're many possible vectorized solutions, but one solution looks like:
%
% grad = (unregularized gradient for logistic regression)
% 	temp = theta; 
% 	temp(1) = 0;   % because we don't add anything for j = 0  
% 	grad = grad + YOUR_CODE_HERE (using the temp variable)

h = sigmoid(X*theta);

initial_cost = (-(y'*log(h) + (1-y)'*log(1-h)) / m);
reg_cost = (lambda * sum(theta(2:end).^2)/(2*m));

J = initial_cost + reg_cost;

% Depending on the dimensions of the vectors below, you need to 
% add or dot product the gradient and the regularization

initial_grad = ((h-y)' * X) / m;	
reg_grad = (lambda * theta(2:end)/m);

grad = initial_grad + [0 ; reg_grad]';

% ============================================================

grad = grad(:);

end
