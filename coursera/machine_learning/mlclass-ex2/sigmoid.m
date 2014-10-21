function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
% J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix, vector or scalar).

% iterate through rows
for i = 1:size(z, 1)

	% iterate through columns
	for j = 1:size(z, 2)

		% update g
		g(i,j) = 1 / (1 + (e)^(-z(i,j))); 

	end

end

% =============================================================

end
