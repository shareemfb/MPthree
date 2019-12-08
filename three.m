exppts = input('Input n sets of experimental points (as an n x 2 matrix): ');
A = size(exppts);
num_set = A(1:1);
maxdeg = num_set - 1;
norm_ev = [];
x = exppts(:,1);
y = exppts(:,2);

if num_set <= 10
    for n = 1:maxdeg
        poly = polyfit(x, y, n);
        ev = y - polyval(poly, x);
        Norm = norm(ev);
        norm_ev(n) = Norm;
    end
elseif num_set > 10
    for n = 1:10
        poly = polyfit(x, y, n);
        ev = y - polyval(poly, x);
        Norm = norm(ev);
        norm_ev(n) = Norm;
    end
end

minimum = min(min(norm_ev));
least_index = find(norm_ev==minimum);
bestfit_poly = polyfit(x, y, least_index);

disp('The coefficients of the polynomial that would best fit the given data are:');
disp(bestfit_poly)