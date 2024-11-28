SetFactory('OpenCASCADE');
SIZE_BL= 1e-05;
THICK_BL= 0.048937072529785144;
h = 0.01;
H = 1;
H_BL = 0.048937072529785144;
Point(1) = {0.0, 0.0, 0, h};
Point(2) = {0.0641141357875468, 0.00046283866687027247, 0, h};
Point(3) = {0.1282282715750936, 0.0018475508607595848, 0, h};
Point(4) = {0.19234240736264038, 0.00414274860749002, 0, h};
Point(5) = {0.2564565431501872, 0.007329529974927595, 0, h};
Point(6) = {0.32057067893773394, 0.011381595661277838, 0, h};
Point(7) = {0.38468481472528077, 0.016265411323175254, 0, h};
Point(8) = {0.4487989505128276, 0.02194041475356546, 0, h};
Point(9) = {0.5129130863003744, 0.028359266772952196, 0, h};
Point(10) = {0.5770272220879211, 0.03546814445699644, 0, h};
Point(11) = {0.6411413578754679, 0.0432070750899497, 0, h};
Point(12) = {0.7052554936630148, 0.051510309008183916, 0, h};
Point(13) = {0.7693696294505615, 0.0603067292823075, 0, h};
Point(14) = {0.8334837652381083, 0.06952029598114995, 0, h};
Point(15) = {0.8975979010256552, 0.07907052256731761, 0, h};
Point(16) = {0.9617120368132019, 0.0888729817930813, 0, h};
Point(17) = {1.0258261726007487, 0.09883983829799281, 0, h};
Point(18) = {1.0899403083882955, 0.10888040495672367, 0, h};
Point(19) = {1.1540544441758422, 0.11890171988797676, 0, h};
Point(20) = {1.218168579963389, 0.12880914091367535, 0, h};
Point(21) = {1.2822827157509358, 0.13850695415262942, 0, h};
Point(22) = {1.3463968515384828, 0.14789899334509016, 0, h};
Point(23) = {1.4105109873260295, 0.15688926643450743, 0, h};
Point(24) = {1.4746251231135763, 0.16538258588080296, 0, h};
Point(25) = {1.538739258901123, 0.17328519914586077, 0, h};
Point(26) = {1.6028533946886698, 0.1805054157769383, 0, h};
Point(27) = {1.6669675304762166, 0.18695422751742943, 0, h};
Point(28) = {1.7310816662637634, 0.19254591789689546, 0, h};
Point(29) = {1.7951958020513104, 0.19719865779345352, 0, h};
Point(30) = {1.8593099378388571, 0.20083508352131274, 0, h};
Point(31) = {1.9234240736264039, 0.20338285407422427, 0, h};
Point(32) = {1.9875382094139507, 0.20477518425151553, 0, h};
Point(33) = {2.0516523452014974, 0.20495135050677396, 0, h};
Point(34) = {2.1157664809890444, 0.20385716648961022, 0, h};
Point(35) = {2.179880616776591, 0.201445425397651, 0, h};
Point(36) = {2.243994752564138, 0.1976763064182941, 0, h};
Point(37) = {2.3081088883516845, 0.19251774271703068, 0, h};
Point(38) = {2.3722230241392315, 0.1859457486204482, 0, h};
Point(39) = {2.436337159926778, 0.17794470384645358, 0, h};
Point(40) = {2.500451295714325, 0.16850759285080388, 0, h};
Point(41) = {2.5645654315018716, 0.15763619758665096, 0, h};
Point(42) = {2.6286795672894185, 0.14534124221138012, 0, h};
Point(43) = {2.6927937030769655, 0.1316424885213928, 0, h};
Point(44) = {2.756907838864512, 0.11656878114942279, 0, h};
Point(45) = {2.821021974652059, 0.10015804181924506, 0, h};
Point(46) = {2.8851361104396056, 0.08245721221793559, 0, h};
Point(47) = {2.9492502462271526, 0.06352214531484707, 0, h};
Point(48) = {3.013364382014699, 0.04341744522785041, 0, h};
Point(49) = {3.077478517802246, 0.02221625600977319, 0, h};
Point(50) = {3.141592653589793, 4.3349126492264023e-17, 0, h};
Spline(1) = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33};
Spline(2) = {33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50};
Point(51) = {2.0516523452014974, 0.6148540515203219, 0, h};
Point(52) = {3.992585948951252, 0.4450443645357005, 0, h};
Line(3) = {51, 52};
Point(53) = {2.0516523452014974, 0.6348540515203219, 0, h};
Point(54) = {3.992585948951252, 0.4650443645357005, 0, h};
Line(4) = {54, 53};
Point(55) = {1.9875382094139507, 0.636463311573494, 0, h};
Point(56) = {1.9875382094139507, 0.624463311573494, 0, h};
Point(57) = {1.9878587800928884, 0.630463311573494, 0, h};
Point(58) = {1.981850222399049, 0.630463311573494, 0, h};
Line(5) = {56, 51};
Line(6) = {53, 55};
Circle(16) = {55, 57, 58};
Circle(19) = {58, 57, 56};
Point(59) = {3.992585948951252, 0, 0, h};
Point(60) = {3.992585948951252, 30.742702576016093, 0, H};
Point(61) = {-31.41592653589793, 30.742702576016093, 0, H};
Point(62) = {-31.41592653589793, 0, 0, H/4};
Point(63) = {-31.41592653589793, 0.048937072529785144, 0, h};
Point(64) = {3.992585948951252, 0.048937072529785144, 0, h};
Point(65) = {3.992585948951252, 0.3961072920059154, 0, h};
Point(66) = {3.992585948951252, 0.5139814370654857, 0, h};
Point(68) = {0, 0.048937072529785144, 0, h};
Point(69) = {3.992585948951252, 0.5139814370654857, 0, h};
Point(70) = {2.0516523452014974, 0.6837911240501071, 0, h};
Point(71) = {1.9875382094139507, 0.6854003841032792, 0, h};
Point(72) = {1.9875382094139507, 0.5755262390437088, 0, h};
Point(73) = {2.0516523452014974, 0.5659169789905367, 0, h};
Point(74) = {3.992585948951252, 0.3961072920059154, 0, h};
Point(75) = {1.9329207722685864, 0.630463311573494, 0, h};
Line(7) = {59, 64};
Line(8) = {64, 65};
Line(17) = {65, 52};
Line(9) = {52, 54};
Line(10) = {54, 66};
Line(18) = {66, 60};
Line(11) = {60, 61};
Line(12) = {61, 63};
Line(13) = {63, 62};
Line(14) = {62,1 };
Line(15) = {50,59 };
Line(20) = {1,68};
Line(21) = {68,63};
Transfinite Line{7} = 65 Using Progression 1.1;
Transfinite Line{13} = 65 Using Progression 0.9090909090909091;
Transfinite Line{17} = 65 Using Progression 0.9090909090909091;
Transfinite Line{10} = 65 Using Progression 1.1;
Transfinite Line{8} = 150 Using Progression 1;
Transfinite Line{19} = 10 Using Progression 1;
Transfinite Line{15} = 150 Using Progression 1;
Transfinite Line{16} = 10 Using Progression 1;
Transfinite Line{18} = 150 Using Progression 1.1;
Transfinite Line{14} = 300 Using Progression 1;
Transfinite Line{20} = 65 Using Progression 1.1;
Transfinite Line{21} = 300 Using Progression 1;
Line(30) = {69, 70};
Line(31) = {70, 71};
Circle(32) = {71, 57, 75};
Line(33) = {72, 73};
Line(34) = {73, 74};
Line(35) = {54, 69};
Line(36) = {70, 53};
Line(37) = {71, 55};
Line(38) = {56, 72};
Line(39) = {73, 51};
Line(40) = {74, 52};
Circle(41) = {75, 57, 72};
Line(42) = {75, 58};
 Transfinite Line{3, 4, 30, 34} = 400;
 Transfinite Line{5, 6, 31, 33} = 150;
 Transfinite Line{16, 19, 32, 41} = 50;
 Transfinite Line{36, 37, 39, 40, 42} = 65 Using Progression 0.9090909090909091;
 Transfinite Line{35, 38} = 65 Using Progression 1.1;
Line Loop(1) = {1, 2, 15, 7, 8, 34, 33, 41, 32, 31, 30, 18, 11, 12, -21, -20};
Line Loop(2) = {4, 6, 16, 19, 5, 3, 9};
Line Loop(3) = {14,20,21,13};
Line Loop(4) = { 35, 30, 36, -4 };
Line Loop(5) = { -36, 31, 37, -6 };
Line Loop(6) = { 37, 16, -42, -32};
Line Loop(7) = { 42, 19, 38, -41};
Line Loop(8) = { 38, 33, 39, -5 };
Line Loop(9) = { -39, 34, 40, -3 };
Line Loop(10) = {34, 33, 41, 32, 31, 30, 10, 9, 17};
Plane Surface(1) = {1};
Plane Surface(2) = {3};
Transfinite Surface(2) = {63,62,1,68};
Recombine Surface(2);
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Plane Surface(6) = {6};
Plane Surface(7) = {7};
Plane Surface(8) = {8};
Plane Surface(9) = {9};
Transfinite Surface{4};
Transfinite Surface{5};
Transfinite Surface{6};
Transfinite Surface{7};
Transfinite Surface{8};
Transfinite Surface{9};
Recombine Surface{4};
Recombine Surface{5};
Recombine Surface{6};
Recombine Surface{7};
Recombine Surface{8};
Recombine Surface{9};
Physical Surface('VOLUME') = {1};
Physical Line('inlet') = {12,13 };
Physical Line('lower_wall') = {14,1, 2,15};
Physical Line('CONVERGENT') = {3, 9, 4, 6, 16, 19, 5};
Physical Line('outlet') = {10, 18,11};
Physical Line('ENGINE') = {7, 8, 17};
Field[1] = BoundaryLayer;
Field[1].CurvesList = {1};
Field[1].Quads = 1;
Field[1].Ratio = 1.1;
Field[1].Size = 1e-05;
Field[1].Thickness = 0.048937072529785144;
Field[1].FanPointsList = {1};
Field[1].FanPointsSizesList = {5};
BoundaryLayer Field = 1;
Field[2] = BoundaryLayer;
Field[2].CurvesList = {2,15};
Field[2].Quads = 1;
Field[2].Ratio = 1.1;
Field[2].Size = 1e-05;
Field[2].Thickness = 0.048937072529785144;
Field[2].FanPointsList = {34};
Field[2].FanPointsSizesList = {5};
BoundaryLayer Field = 2;
//+
Physical Point(7) -= {57};
//+
Recursive Delete {
  Point{57}; 
}
Mesh.SaveAll = 1;
