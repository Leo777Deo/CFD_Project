h = 0.1;

Point(1) = {0, 0, 0, h};
Point(2) = {1.25, 0, 0, h};
Point(3) = {1.50, -0.5, 0, 1};
Point(4) = {1.75, 0, 0, h};
Point(5) = {3., 0, 0, h}; 
Point(6) = {6., 0, 0, h};
Point(7) = {6., 1., 0, h};
Point(8) = {3., 1., 0, h};
Point(9) = {0., 1., 0, h};

Line(1) = {1, 2};
Circle(2) = {2, 3, 4};
Line(3) = {4, 5};
Line(4) = {5, 6};
Line(5) = {6, 7};
Line(6) = {7, 8};
Line(7) = {8, 9};
Line(8) = {9, 1};

Line Loop(1) = {1, 2, 3, 4, 5, 6, 7, 8};
Plane Surface(1) = {1};

Physical Line ("inlet") = {8} ;
Physical Line ("lower_wall") = {1, 2, 3, 4} ;
Physical Line ("outlet") = {5} ;
Physical Line ("upper_wall") = {6} ;


Physical Surface(2) = {1} ;

Transfinite Line{-8} = 40 Using Progression 1.05;
Transfinite Line{5} = 80 ;
Transfinite Line{1,3} = 81 ;
Transfinite Line{2} = 99;
Transfinite Line{4} = 193;
Transfinite Line{6} = 193;
Transfinite Line{7} = 48 Using Progression 1.02;

Transfinite Surface{7} = {1,6,7,9};

Recombine Surface{7};


