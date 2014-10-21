function [X_norm, mu, sigma] = featureNormalize(X)

mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

for j = 1:size(X, 2)
	
	temp_mu = mean(X(:,j)) % mean for this feature
	temp_std = std(X(:,j)) % std for this feature
	
	mu(j) = temp_mu		% populating the mu vector
	sigma(j) = temp_std	% populating the sigma vector
	
	for i = 1:size(X, 1)
		X(i,j) = (X(i,j) - temp_mu)/temp_std		
	end

end
X_norm = X;

end
