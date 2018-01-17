function [J, grad] = cost(theta, X, y, lambda)

m = length(y); 


J = 0;
grad = zeros(size(theta));

J=((-(y')*log(sigmoid(X*theta)))-((1-y)'*log(1-sigmoid(X*theta))))/m + (sum(theta.*theta)-theta(1,1)*theta(1,1))*lambda/(2*m);

grad =(X')*(sigmoid(X*theta)-y)/m ;

grad(2:end,1)=grad(2:end,1)+lambda*theta(2:end,1)/m;

end
