function score = evaluate(A,b,x)
% compute score of trained model on test data

    score = 0;  % initialize
    s = A*x;
    ind = find(s > 0);
    s(ind) = 1;
    ind = find(s <= 0);
    s(ind) = -1;
    t = s .* b;
    ind = find(t < 0);
    t(ind) = 0;
    score = 1 - sum(t) / numel(t);

end