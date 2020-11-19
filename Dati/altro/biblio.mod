param nB;
param nG;

set B := 0 .. nB-1;
set G := 0 .. nG-1;

param C{G};
param f{B,G,B,G} default 0;
param v{B};

var x{B,G} binary;
var y{B,G,B,G} binary;

minimize z: sum{i in B, g in G, j in B, h in G: j != i} f[i,g,j,h]/(v[i] * v[j]) * y[i,g,j,h];

s.t. assign{i in B}: sum{g in G} x[i,g] = v[i];
s.t. max_stop{g in G}: sum{i in B} x[i,g] <= C[g];
s.t. linearize{i in B, g in G, j in B, h in G}: x[i,g] + x[j,h] - 1 <= y[i,g,j,h];

end;


