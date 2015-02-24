function x = soft_SVM(lam)
%fitting a soft margin support vector machine to classify the digits

[D,b] = load_data();

L = 2*norm(diag(b)*D')^2;
alpha = 1/(L + 2*lam);
x0 = [1:size(D,1)]';
x = SVM_grad(D,b,x0,alpha,lam);

    function [D,b] = load_data()
        data = csvread('optdigits_train.csv');
        D = data(:,(1:size(data,2)-1));
        D = D';
        b = data(:,size(data,2));
    end

    function x = SVM_grad(D,b,x0,alpha,lam)
        x = x0;
        iter = 1;
        maxit = 5000;
        grad = 1;
        
        while  norm(grad) > 10^-6 && iter < maxit
        
        % form gradient and take step
        U = [0, zeros(1,size(D,1)-1); zeros(size(D,1)-1,1), eye(size(D,1)-1)];
        grad =  -2*D*diag(b)*max(ones(length(D),1)-diag(b)*D'*x,0)+2*lam*U*x;
        x = x - alpha*grad;

        % update iteration count
        iter = iter + 1;
        
        end
        
    end

end