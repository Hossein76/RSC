function p = accuracy(all_theta, X)
 

m = size(X, 1);
num_labels = size(all_theta, 1);

p = zeros(size(X, 1), 1);

X = [ones(m, 1) X];

a=all_theta*(X');

[M,I]=max(a);

p=I';


end
