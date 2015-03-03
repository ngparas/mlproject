function x = soft_SVM(D, b, lambda)
%set initial point
x0 = zeros(size(D,1),1);

x = hessian_descent(x0, D, b, lambda);
%x = grad_descent_soft_SVM();

% performs hessian descent
function [x] = hessian_descent(x0, D, b, lambda)

    % initializations
    grad_stop = 10^-8;
    max_its = 500;
    iter = 1;
    grad_eval = 1;
    x = x0;
    
    oneMat = ones(size(D,2),1);
    
    %Define U
    U = eye(length(x));
    U(1,1) = 0;
  
    % main loop
    while norm(grad_eval) > grad_stop && iter <= max_its
        % take step
        grad_eval = grad(x, D, b, lambda, U, oneMat);
        hess_eval = hess(x, D, b, lambda, U);
        %if abs(hess_eval) < 10^-6
        %    hess_eval = sign(hess_eval)*10^-5;
        %end
        %x = x - grad_eval/hess_eval;
        
        x = x - pinv(hess_eval)*grad_eval;
        
        % update stopers
        iter = iter + 1;
    end  
end

% evaluate the gradient
function z = grad(x, D, b, lambda, U, oneMat)
    z =  -2 * D * diag(b) * max(oneMat - diag(b) * D' * x,0) + 2 * lambda * U * x;
end 

% evaluate the hessian
function H = hess(x, D, b, lambda, U)
    %find set of indices, S, where 1-bndn'x >= 0
    S = zeros(size(b,2),1);
    size(S)
    for ii = 1:size(b,2)
       if (1 - b(ii)*D(:,ii)'*x) >= 0
          S(ii) = 1; 
       end
    end
    
    %initialize DsubS
    Ds = zeros(size(D,1),sum(S));
    size(Ds)
    stackInd = 1;
    for incInd = 1:size(S)
        if S(incInd) == 1
            Ds(:,stackInd) = D(:,incInd);
            stackInd = stackInd + 1;
        end
    end
    
    H = 2 * (Ds * Ds') + 2* lambda* U;
end 

function x = grad_descent_soft_SVM(x0, D, b, lambda, alpha)
    % Initializations 
    x = x0;
    iter = 1;
    max_its = 3000;
    grad = 1;

    while  norm(grad) > 10^-6 && iter < max_its
        
        % form gradient and take step
        k = size(D,1);
        U = zeros(k);
        U(2:k,2:k) = eye(k-1);
        grad = -2 * D * diag(b) * max(0, ones(size(b,2),1)-diag(b)*D'*x) + 2 * lambda * U * x;
        x = x - alpha*grad;

        % update iteration count
        iter = iter + 1;
    end
end


end
