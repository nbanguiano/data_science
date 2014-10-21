function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters) 

m = length(y) % number of training examples
J_history = zeros(num_iters, 1)

for iter = 1:num_iters
	
	h = X * theta;
	
	e = h - y;

	theta = theta - (alpha*(e' * X)')/m;
	% Always have to play a lot as to how the theta vector is sent. some will send it as a N*1, or 1*N, so you always need to play with the transposes in these excercises...

	J_history(iter) = computeCostMulti(X, y, theta);

end

end