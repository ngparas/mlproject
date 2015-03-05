function lam = cross_validate_classification(k,D,b,lambda_range)

   n = size(D,2);
   indices = generate_indices(n, k);
   lam = cross_validate(D,b,indices,lambda_range);
   
    function fold_indices = generate_indices(n, k)
        fold_sizes = floor(n / k) * ones(k,1);
        if mod(n,k) > 0
            fold_sizes(1:mod(n,k)) = fold_sizes(1:mod(n,k)) + 1;
        end
        current_i = 1;
        fold_indices = ones(n,1);
        for f=1:k
            start = current_i;
            stop = current_i + fold_sizes(f) - 1;
            fold_indices(start:stop) = f;
            current_i = stop + 1;
        end
    end

function lam = cross_validate(A,b,c, lams)  
    %%% performs k-fold cross validation
    % generate features     
    
    % solve for weights and collect test errors
    test_errors = [];
    train_errors = [];

    for i = 1:length(lams)
        lam = lams(i);
        test_resids = [];
        train_resids = [];

        for j = 1:k
            A_1 = A(:,find(c ~= j));
            b_1 = b(find(c ~= j));
            A_2 = A(:,find(c==j));
            b_2 = b(find(c==j));
            
            % run soft-margin SVM with chosen lambda
            x = soft_SVM(A_1,b_1,lam);
            
           resid = evaluate(A_2,b_2,x);
           test_resids = [test_resids resid];
           resid = evaluate(A_1,b_1,x);
           train_resids = [train_resids resid];
        end
        test_errors = [test_errors; test_resids];
        train_errors = [train_errors; train_resids];

    end

    % find best parameter per data-split
    %for i = 1:k
        %[val,j] = min(test_errors(:,i));
        %A_1 = A(find(c ~= i),:);
        %b_1 = b(find(c ~= i));
        
        % run soft-margin SVM with chosen lambda
        %lam = lams(j);
        %x = soft_SVM(A_1,b_1,lam);
  
        
        %%% find the worst performer (per split) and plot it %%%
        %[val,j] = max(test_errors(:,i));
        %A_1 = A(find(c ~= i),:);
        %b_1 = b(find(c ~= i)); 

        % run soft-margin SVM with chosen lambda
        %lam = lams(j);
        %x = soft_SVM(A_1',b_1,lam);
    %end
    test_ave = mean(test_errors');
    [val,j] = min(test_ave);
    
    lam = lams(j);
end

function score = evaluate(A,b,x)
% compute score of trained model on test data

    score = 0;  % initialize
    s = A' * x;
    ind = find(s > 0);
    s(ind) = 1;
    ind = find(s <= 0);
    s(ind) = -1;
    t = s' .* b;
    ind = find(t < 0);
    t(ind) = 0;
    score = 1 - sum(t) / numel(t);

end
end
