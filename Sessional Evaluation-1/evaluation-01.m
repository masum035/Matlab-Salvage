%% time only 20 minutes!!!
% 201914044 - sec-A
N=input("input N");

mat = [round(rand(N,N)*10)]

a = input("row ");
b = input("row ");
row_a = [mat(a,:)] 
row_b = [mat(b,:)]
% swapp = [a;b]
neww = mat;
% new = flip(swapp) hoi_na

function A = swapRow(A, row1, row2)
  A([row2, row1], :) = A([row1, row2], :);
  end
  
  swapRow(neww,a,b)
  
mat = neww;

command = input();

if command == "inc"
    Q = mat.+1 
elseif command == "dec"
    P = mat.-1
elseif command == "transpose"
    T = mat'
end

% random matrix
% row a b
% inc
% dec
% transpose
%implemented
