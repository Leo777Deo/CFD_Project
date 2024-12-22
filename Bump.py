# WITH BUMP
from os import write
import numpy as np
import matplotlib.pyplot as plt
import math

# Define bump parameters
# delta = np.pi / 28
# K = 1.3
# c = 0
# yp = 0
delta = np.pi / 15
K = 1
c = 0
yp = 0
# Define the function for the top boundary
def f_top(x):
    return np.sqrt(((x**2 * (np.tan(delta))**2) + c)) / ((1 / np.cos(np.arctan(yp / K)))**2) * np.sin(x) * np.sin((yp + np.pi) / 2) * np.sin(x)/2

# Discretize the function into points
N_points_bump =50 # Number of points for bump
x_vals = np.linspace(0, np.pi, N_points_bump)
y_vals_top = f_top(x_vals)*1.4/np.pi
x_vals = np.linspace(0, 1.4, N_points_bump)

# Define the starting point of the new line

Delta_x = 4 # Distance in terms of discretization points from the maximum of the bump
Delta_conv = 1 # Distance in terms of discretization points from the start of the inner part of conv. to outer
y_dist = 3 # multiplication factor that increases distance between max of bump and initial point of inner convergent
thick_conv = 0.02 # Additive quantity to the end point of the convergent to close it
thick_conv2 = 0.2 * thick_conv
angle_deg = -0 # Angle of the convergent, taken from Web Plot Digitizer from image of the thesis of sweden guy
index_line_bump = np.argmax(y_vals_top) + Delta_x
x_start = x_vals[index_line_bump]
End_line_param = 1.4
line_length = End_line_param - x_start
y_start = 0.59*line_length
x_start_bl = 0

x_start_up = x_vals[index_line_bump]
y_start_up = y_start + thick_conv

angle_rad = np.radians(angle_deg)

x_start_conv = x_vals[index_line_bump - 1]
y_start_conv = y_start_up - (x_start - x_start_conv)*np.tan(angle_rad)


# Define the length of the line segment

x_end = x_vals[-1]
y_end = y_start + line_length * np.sin(angle_rad)

x_end_up = x_end
y_end_up = y_start_up + line_length * np.sin(angle_rad)

# Define Far Field
Y_DIST = 25 # Multiplication factor of maximum of bump to create far field Y
Y_END = Y_DIST * y_vals_top[np.argmax(y_vals_top)]
X_DIST = -3 # Multiplication factor of end x point of bump to create far field X
X_START = X_DIST * x_vals[np.argmax(x_vals)]
X_END = x_end


size_bl = 0.00001
n_bl = 65 # Number of layers
r = 1.1  # Growth ratio

# Compute the total boundary layer thickness
thick_bl = size_bl * (r**n_bl - 1) / (r - 1)

thick_FF = thick_bl - 0.003


# .geo file creation:
with open("mesh_bump.geo", "w") as file:

    file.write("SetFactory('OpenCASCADE');\n")

    file.write(f"SIZE_BL= {size_bl};\n")
    file.write(f"THICK_BL= {thick_bl};\n")

    file.write("h = 0.01/4;\n") # Size of cells close to bump and convergent
    file.write("H = 0.1;\n") # Size of cells close to farfield
    file.write(f"H_BL = {thick_bl};\n") # Size of geometrical step of structured mesh

    # Write points for the bump
    for i, (x, y) in enumerate(zip(x_vals, y_vals_top)):
      file.write(f"Point({i + 1}) = {{{x}, {y}, 0, h}};\n")

    # Define spline from the first point to the maximum
    file.write(f"Spline(21) = {{{', '.join(str(i + 1) for i in range(np.argmax(y_vals_top) + 1))}}};\n")

    # Define spline from the maximum to the end
    file.write(f"Spline(22) = {{{', '.join(str(i + 1) for i in range(np.argmax(y_vals_top), len(x_vals)))}")
    file.write("};\n")

    # Define points for the new line with -5° slope and the upper parallel line
    new_point_start = len(x_vals) + 1
    new_point_end = new_point_start + 1
    upper_point_start = new_point_end + 1
    upper_point_end = upper_point_start + 1
    upper_conv = upper_point_end + 1
    lower_conv = upper_conv + 1
    circle_centre = lower_conv + 1
    center_convergent = circle_centre + 1

    # Write the convergent shape points and lines
    file.write(f"Point({new_point_start}) = {{{x_start}, {y_start}, 0, h}};\n")
    file.write(f"Point({new_point_end}) = {{{x_end}, {y_end}, 0, h}};\n")


    file.write(f"Point({upper_point_start}) = {{{x_start_up}, {y_start_up}, 0, h}};\n")
    file.write(f"Point({upper_point_end}) = {{{x_end_up}, {y_end_up}, 0, h}};\n")


    y_upper_conv = y_start_conv - thick_conv2
    y_lower_conv = y_start_conv + thick_conv2 - thick_conv

    #file.write(f"Point({upper_conv}) = {{{x_start_conv}, {y_upper_conv}, 0, h}};\n")
    #file.write(f"Point({lower_conv}) = {{{x_start_conv}, {y_lower_conv}, 0, h}};\n")
    file.write(f"Point({circle_centre}) = {{{x_start}, {y_start + thick_conv/2}, 0, h}};\n")

    # Computation of the radius of the circle of the convergent intake, given the center position and two points
    hhh = x_start_conv + (x_start_up - x_start_conv)/10      #float(input("Inserisci la coordinata x del centro (h): "))
    kkk = (y_upper_conv + y_lower_conv)/2      #float(input("Inserisci la coordinata y del centro (k): "))
    xxx1 = x_start_conv     #float(input("Inserisci la coordinata x del punto sulla circonferenza: "))
    yyy1 = y_upper_conv     #float(input("Inserisci la coordinata y del punto sulla circonferenza: "))
    raggio1 = math.sqrt((xxx1 - hhh)**2 + (yyy1 - kkk)**2)
    front_nose = raggio1

    file.write(f"Point({center_convergent}) = {{{x_start - thick_conv/2}, {y_start + thick_conv/2}, 0, h}};\n")

    # Define connecting lines for closed convergent surface
    file.write(f"Line({1}) = {{{new_point_end}, {new_point_start}}};\n")
    #file.write(f"Line({2}) = {{{new_point_start}, {lower_conv}}};\n")
    file.write(f"Circle({3}) = {{{center_convergent}, {circle_centre}, {new_point_start}}};\n")  # Circle definition (start point, centre point, end point)
    file.write(f"Circle({4}) = {{{upper_point_start}, {circle_centre}, {center_convergent}}};\n")  # Circle definition (start point, centre point, end point)
    #file.write(f"Line({5}) = {{{upper_conv}, {upper_point_start}}};\n")
    file.write(f"Line({6}) = {{{upper_point_start}, {upper_point_end}}};\n")




    # Boundary points for the entire domain
    boundary_point_1 = center_convergent + 1
    boundary_point_2 = boundary_point_1 + 1
    boundary_point_3 = boundary_point_2 + 1
    boundary_point_4 = boundary_point_3 + 1
    boundary_point_5 = boundary_point_4 + 1

    boundary_point_6 = boundary_point_5 + 1
    boundary_point_7 = boundary_point_6 + 1
    boundary_point_8 = boundary_point_7 + 1
    boundary_point_9 = boundary_point_8 + 1
    boundary_point_10 = boundary_point_9 + 1

    file.write(f"Point({boundary_point_1}) = {{{x_end}, 0, 0, h}};\n")
    file.write(f"Point({boundary_point_2}) = {{{X_END}, {Y_END}, 0, H}};\n")
    file.write(f"Point({boundary_point_3}) = {{{X_START}, {Y_END}, 0, H}};\n")
    file.write(f"Point({boundary_point_4}) = {{{X_START}, 0, 0, H}};\n")

    file.write(f"Point({boundary_point_5}) = {{{X_END}, {thick_bl}, 0, h}};\n") # thick_bl
    file.write(f"Point({boundary_point_6}) = {{{X_END}, {y_end - thick_bl}, 0, h}};\n") # thick_bl
    file.write(f"Point({boundary_point_7}) = {{{X_END}, {y_end_up + thick_bl}, 0, h}};\n") # thick_bl
    #file.write(f"Point({boundary_point_8}) = {{{x_start_bl}, 0, 0, h}};\n")
    #file.write(f"Point({boundary_point_9}) = {{{x_start_bl}, {thick_bl}, 0, h}};\n")


    # Computation of the radius of the circle of the convergent intake B.L., given the center position and two points
    hhh2 = x_start_conv + (x_start_up - x_start_conv)/200      #float(input("Inserisci la coordinata x del centro (h): "))
    kkk2 = (y_upper_conv + y_lower_conv)/2      #float(input("Inserisci la coordinata y del centro (k): "))
    xxx2 = x_start_conv     #float(input("Inserisci la coordinata x del punto sulla circonferenza: "))
    yyy2 = y_upper_conv + thick_bl    #float(input("Inserisci la coordinata y del punto sulla circonferenza: "))
    raggio2 = math.sqrt((xxx2 - hhh2)**2 + (yyy2 - kkk2)**2)
    front_nose_BL = raggio2

    # file.write(f"Point({BL_conv_7}) = {{{x_start_conv + (x_start_up - x_start_conv)/200 - front_nose_BL}, {(y_upper_conv + y_lower_conv)/2}, 0, h}};\n")

    # Define lines for the main boundary
    file.write(f"Line({7}) = {{{upper_point_end}, {boundary_point_7}}};\n")
    file.write(f"Line({8}) = {{{boundary_point_7}, {boundary_point_2}}};\n")
    file.write(f"Line({9}) = {{{boundary_point_2}, {boundary_point_3}}};\n")
    file.write(f"Line({10}) = {{{boundary_point_3}, {boundary_point_4}}};\n")
    file.write(f"Line({12}) = {{{boundary_point_4},{1} }};\n")
    #file.write(f"Line({13}) = {{{boundary_point_8},{boundary_point_1} }};\n")
    file.write(f"Line({14}) = {{{boundary_point_1}, {boundary_point_5}}};\n")
    file.write(f"Line({15}) = {{{boundary_point_5}, {boundary_point_6}}};\n")
    file.write(f"Line({16}) = {{{boundary_point_6}, {new_point_end}}};\n")
    #file.write(f"Line({18}) = {{{boundary_point_9},{boundary_point_5}}};\n")
    #file.write(f"Line({19}) = {{{boundary_point_8},{boundary_point_9}}};\n")


    file.write(f"Transfinite Line{{{12}}} = {120} Using Progression {1/r};\n")
    #file.write(f"Transfinite Line{{{13}}} = {400} Using Progression {1};\n")
    #file.write(f"Transfinite Line{{{18}}} = {400} Using Progression {1};\n")
    #file.write(f"Transfinite Line{{{19}}} = {n_bl} Using Progression {r};\n")
    file.write(f"Transfinite Line{{{14}}} = {n_bl} Using Progression {r};\n")
    file.write(f"Transfinite Line{{{4}}} = {20} Using Progression {1};\n")
    file.write(f"Transfinite Line{{{3}}} = {20} Using Progression {1};\n")
    file.write(f"Transfinite Line{{{7}}} = {n_bl} Using Progression {r};\n")
    file.write(f"Transfinite Line{{{16}}} = {n_bl} Using Progression {1/r};\n")
    file.write(f"Transfinite Line{{{20}}} = {10} Using Progression {1};\n")



    file.write("Line Loop(1) = {1, -3, -4, 6, 7, 8, 9, 10, 12, 21, 22, 14, 15, 16};\n")
    #file.write("Line Loop(2) = {13, 14, -18, -19};\n")


    #Define the fluid domain
    file.write("Plane Surface(1) = {1};\n")
    file.write("Plane Surface(2) = {2};\n")
    #file.write("Transfinite Surface{2} = {")
    #file.write(f"{boundary_point_8},{boundary_point_1},{boundary_point_5},{boundary_point_9}")
    #file.write("};\n")
    file.write("Recombine Surface{2};\n")


    file.write("Field[1] = BoundaryLayer;\n")
    file.write("Field[1].CurvesList = {1, 3};\n")
    file.write("Field[1].Quads = 1;\n")
    file.write(f"Field[1].Ratio = {r};\n")
    file.write(f"Field[1].Size = {size_bl};\n") #  0.00001
    file.write(f"Field[1].Thickness = {thick_bl};\n") #  0.07
    file.write("Field[1].FanPointsList = {1};\n")
    file.write("Field[1].FanPointsSizesList = {20};\n")
    file.write("BoundaryLayer Field = 1;\n")

    file.write("Field[2] = BoundaryLayer;\n")
    file.write("Field[2].CurvesList = {4, 6};\n")
    file.write("Field[2].Quads = 1;\n")
    file.write(f"Field[2].Ratio = {r};\n")
    file.write(f"Field[2].Size = {size_bl};\n") #  0.00001
    file.write(f"Field[2].Thickness = {thick_bl};\n") #  0.07
    file.write("Field[2].FanPointsList = {3};\n")
    file.write("Field[2].FanPointsSizesList = {20};\n")
    file.write("BoundaryLayer Field = 2;\n")

    file.write("Field[3] = BoundaryLayer;\n")
    file.write("Field[3].CurvesList = {21};\n")
    file.write("Field[3].Quads = 1;\n")
    file.write(f"Field[3].Ratio = {r};\n")
    file.write(f"Field[3].Size = {size_bl};\n") #  0.00001
    file.write(f"Field[3].Thickness = {thick_bl};\n") #  0.07
    file.write("Field[3].FanPointsList = {1};\n")
    file.write("Field[3].FanPointsSizesList = {5};\n")
    file.write("BoundaryLayer Field = 3;\n")

    file.write("Field[4] = BoundaryLayer;\n")
    file.write("Field[4].CurvesList = {22};\n")
    file.write("Field[4].Quads = 1;\n")
    file.write(f"Field[4].Ratio = {r};\n")
    file.write(f"Field[4].Size = {size_bl};\n") #  0.00001
    file.write(f"Field[4].Thickness = {thick_bl};\n") #  0.07
    file.write("Field[4].FanPointsList = {")
    file.write(f"{34}")
    file.write("};\n")
    file.write("Field[4].FanPointsSizesList = {")
    file.write(f"{5}")
    file.write("};\n")
    file.write("BoundaryLayer Field = 4;\n")




    file.write("Physical Surface('VOLUME') = {1:2};\n")


    # Physical lines and surfaces for boundary conditions
    file.write("Physical Line('inlet') = {10};\n")

    file.write("Physical Line('lower_wall') = {21,22};\n")
    file.write("Physical Line('euler_wall') = {12};\n")
    file.write("Physical Line('CONVERGENT') = {1, -3, -4, 6};\n")

    file.write("Physical Line('outlet') = {7, 8, 9};\n")
    file.write("Physical Line('ENGINE') = {14, 15, 16};\n")




from google.colab import files
files.download("mesh_bump.geo")


    file.write("Field[1] = BoundaryLayer;\n")
    file.write("Field[1].CurvesList = {1, 3};\n")
    file.write("Field[1].Quads = 1;\n")
    file.write(f"Field[1].Ratio = {r};\n")
    file.write(f"Field[1].Size = {size_bl};\n") #  0.00001
    file.write(f"Field[1].Thickness = {thick_bl};\n") #  0.07
    file.write("Field[1].FanPointsList = {1};\n")
    file.write("Field[1].FanPointsSizesList = {20};\n")
    file.write("BoundaryLayer Field = 1;\n")

    file.write("Field[2] = BoundaryLayer;\n")
    file.write("Field[2].CurvesList = {4, 6};\n")
    file.write("Field[2].Quads = 1;\n")
    file.write(f"Field[2].Ratio = {r};\n")
    file.write(f"Field[2].Size = {size_bl};\n") #  0.00001
    file.write(f"Field[2].Thickness = {thick_bl};\n") #  0.07
    file.write("Field[2].FanPointsList = {3};\n")
    file.write("Field[2].FanPointsSizesList = {20};\n")
    file.write("BoundaryLayer Field = 2;\n")

    file.write("Field[3] = BoundaryLayer;\n")
    file.write("Field[3].CurvesList = {21};\n")
    file.write("Field[3].Quads = 1;\n")
    file.write(f"Field[3].Ratio = {r};\n")
    file.write(f"Field[3].Size = {size_bl};\n") #  0.00001
    file.write(f"Field[3].Thickness = {thick_bl};\n") #  0.07
    file.write("Field[3].FanPointsList = {1};\n")
    file.write("Field[3].FanPointsSizesList = {5};\n")
    file.write("BoundaryLayer Field = 3;\n")

    file.write("Field[4] = BoundaryLayer;\n")
    file.write("Field[4].CurvesList = {22};\n")
    file.write("Field[4].Quads = 1;\n")
    file.write(f"Field[4].Ratio = {r};\n")
    file.write(f"Field[4].Size = {size_bl};\n") #  0.00001
    file.write(f"Field[4].Thickness = {thick_bl};\n") #  0.07
    file.write("Field[4].FanPointsList = {")
    file.write(f"{34}")
    file.write("};\n")
    file.write("Field[4].FanPointsSizesList = {")
    file.write(f"{5}")
    file.write("};\n")
    file.write("BoundaryLayer Field = 4;\n")




    file.write("Physical Surface('VOLUME') = {1:2};\n")


    # Physical lines and surfaces for boundary conditions
    file.write("Physical Line('inlet') = {10};\n")

    file.write("Physical Line('lower_wall') = {21,22};\n")
    file.write("Physical Line('euler_wall') = {12};\n")
    file.write("Physical Line('CONVERGENT') = {1, -3, -4, 6};\n")

    file.write("Physical Line('outlet') = {7, 8, 9};\n")
    file.write("Physical Line('ENGINE') = {14, 15, 16};\n")




from google.colab import files
files.download("mesh_bump.geo")