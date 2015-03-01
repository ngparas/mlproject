function x = soft_svm(D, b, lambda)
% lambda = 10^2
L = 2*norm(diag(b)*D')^2;
alpha = 1/(L + 2*lambda);        % step length
x0 = [1;2;3];    % initial point

%x, in, out = hessian_descent(x)
x = grad_descent_soft_SVM();

% performs hessian descent
function [x,in,out] = hessian_descent(x)

    % initializations
    grad_stop = 10^-3;
    max_its = 50;
    iter = 1;
    in = [x];    
    out = [obj(x)];
    grad_eval = 1;
  
    % main loop
    while abs(grad_eval) > grad_stop && iter <= max_its
        % take gradient step
        grad_eval = grad(x);
        hess_eval = hess(x);
        if abs(hess_eval) < 10^-6
            hess_eval = sign(hess_eval)*10^-5;
        end
        x = x - grad_eval/hess_eval;
        
        % update containers
        in = [in x];
        out = [out obj(x)];
        
        % update stopers
        iter = iter + 1;
    end  
end

% evaluate the objective
function z = obj(y)
    z = 'TODO';
end 

% evaluate the gradient
function z = grad(y)
    z =  -2 * D * diag(b) * max(ones(length(D),1) - diag(b) * D' * x,0) + 2 * lambda * U * x;
end 

% evaluate the hessian
function z = hess(y)
    z = 'TODO';
end 
       

function x = grad_descent_soft_SVM()
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
        grad = -2 * D * diag(b) * max(0, ones(size(b,2))-diag(b)*D'*x) + 2 * lambda * U * x;
        x = x - alpha*grad;

        % update iteration count
        iter = iter + 1;
    end
end


end
