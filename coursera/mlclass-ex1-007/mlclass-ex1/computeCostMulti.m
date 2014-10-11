function J = computeCostMulti(X, y, theta)

m = length(y); % number of training examples

h = X * theta % h of x as I understand it

sqerr = sum((h - y).^2) % sum of squared errors
	
	J = sqerr/(2*m) % cost

end
