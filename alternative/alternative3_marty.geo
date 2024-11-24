// se runnato dà Error : Unable to recover the edge 927 (2/2) on curve 57 (on surface 1), però teoricamente il circle è scritto giusto :c

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

Point(51) = {2.436337159926778, 0.6148540515203219, 0, h};
Point(52) = {3.994049790810803, 0.47857185528682766, 0, h};

Line(51) = {51, 52};

Point(53) = {2.436337159926778, 0.6348540515203219, 0, h};
Point(54) = {3.994049790810803, 0.4985718552868277, 0, h};

Line(52) = {54, 53};


Point(55) = {2.3722230241392315, 0.631463311573494, 0, h};
Point(56) = {2.3722230241392315, 0.630463311573494, 0, h};
Point(57) = {2.3716730241392315, 0.630963311573494, 0, h};
 

Line(53) = {56, 51};
Line(54) = {53, 55};

Circle(64) = {55, 57, 56};

Line(65) = {52, 54};

Point(58) = {3.994049790810803, 0, 0, h};
Point(59) = {3.994049790810803, 30.742702576016093, 0, H};
Point(60) = {-78.53981633974483, 30.742702576016093, 0, H};
Point(61) = {-78.53981633974483, 0, 0, H};
Point(62) = {-78.53981633974483, 0.048937072529785144, 0, H};
Point(63) = {3.994049790810803, 0.048937072529785144, 0, H};
Point(64) = {3.994049790810803, 0.42963478275704253, 0, H};
Point(65) = {3.994049790810803, 0.5475089278166129, 0, H};

Line(55) = {58, 63};
Line(56) = {63, 64};
Line(66) = {64, 52};
Line(57) = {52, 54};
Line(58) = {54, 65};
Line(67) = {65, 59};
Line(59) = {59, 60};
Line(60) = {60, 62};
Line(61) = {62, 61};
Line(62) = {61, 1};
Line(63) = {50, 58};

Transfinite Line{55} = 65 Using Progression 1.1;
Transfinite Line{61} = 65 Using Progression 0.9090909090909091;
Transfinite Line{66} = 65 Using Progression 0.9090909090909091;
Transfinite Line{58} = 65 Using Progression 1.1;
Transfinite Line{56} = 150 Using Progression 1;
Transfinite Line{67} = 150 Using Progression 1.1;
Transfinite Line{60} = 150 Using Progression 0.9090909090909091;
Transfinite Line{62} = 150 Using Progression 1;
Transfinite Line{63} = 150 Using Progression 1;

Line Loop(1) = {1, 2, 63, 55, 56, 66, 57, 58, 67, 59, 60, 61, 62};
Line Loop(2) = {51, 65, 52, 54, 64, 53};

Plane Surface(1) = {1,2};

Physical Surface('VOLUME') = {1};

Physical Line('inlet') = {60, 61};
Physical Line('lower wall') = {62, 1, 2, 63};
Physical Line('upper wall') = {59};
Physical Line('CONVERGENT') = {51, 65, 52, 54, 64, 53};
Physical Line('outlet') = {58, 67};
Physical Line('ENGINE') = {55, 56, 66};

Field[1] = BoundaryLayer;
Field[1].CurvesList = {62, 1, 2, 63};
Field[1].Quads = 1;
Field[1].Ratio = 1.1;
Field[1].Size = 1e-05;
Field[1].Thickness = 0.048937072529785144;
Field[1].FanPointsList = {1};
Field[1].FanPointsSizesList = {5};
BoundaryLayer Field = 1;
Field[2] = BoundaryLayer;
Field[2].CurvesList = {52,54,64,53,51};
Field[2].Quads = 1;
Field[2].Ratio = 1.1;
Field[2].Size = 1e-05;
Field[2].Thickness = 0.048937072529785144;
BoundaryLayer Field = 1;
