function c = computeCost(y, h, m)
%computeCost Computes logistic cost given y, h-of-x, and number of training examples m

c = (-(y.*log(h) + (1-y).*log(1-h)) / m);
c = sum(sum(c));
end