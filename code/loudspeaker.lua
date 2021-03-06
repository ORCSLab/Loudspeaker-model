-- Loudspeaker design model - a test benchmark for electromagnetic optimization
-- by Felipe Campelo (fcampelo@gmail.com)
-- 
-- Feel free to use this model in any of your works, but please acknowledge the source as:
-- F. Campelo, "Loudspeaker design model - a test benchmark for electromagnetic 
-- optimisation." [online]. Available from http://www.cpdee.ufmg.br/~fcampelo/files/loudspeaker/.
--
--Suggested limits for the variables:
--      Min      Max      Variable
--    3.0000   12.0000;     x1 
--    1.0000    4.0000;     x2 
--    1.0000    4.0000;     x3 
--    0.0000    3.0000;     x4 
--    5.0000   15.0000;     x5 
--    2.0000    5.0000;     x6 
--    1.0000   10.0000;     x7 
--    1.0000    3.0000;     x8 
--    0.5000    2.0000;     x9 
--    0.0000    3.0000;     x10 
--    1.0000    5.0000;     x11 
--    2.0000    5.0000;     x12 
--    0.5000    2.0000;     x13 
--    5.0000   12.0000;     x14 
--    2.0000    5.0000;     x15 
--    1.0000   5.0000;      x16 

------------------------------------------------------------------------------------------

-- FEMM version control
setcompatibilitymode(0) -- Good for Version 4.2

-- Path for files (CHANGE AS NEEDED)
infile = "C:\\Documents and Settings\\fcampelo\\Meus documentos\\Academia\\Models\\loudspeaker\\loudspeaker.in"
outfile = "C:\\Documents and Settings\\fcampelo\\Meus documentos\\Academia\\Models\\loudspeaker\\loudspeaker.out"
femfile = "C:\\Documents and Settings\\fcampelo\\Meus documentos\\Academia\\Models\\loudspeaker\\loudspeaker.fem"


-- The first value in the source file MUST be the number of devices to evaluate.
handle = openfile(infile,"r")
nind = read(handle,"*n")

X1 = {}
X2 = {}
X3 = {}
X4 = {}
X5 = {}
X6 = {}
X7 = {}
X8 = {}
X9 = {}
X10 = {}
X11 = {}
X12 = {}
X13 = {}
X14 = {}
X15 = {}
X16 = {}

cc = 0
-- Read the loudspeaker parameters from a source file.
while cc < nind do
	X1[cc] = read(handle,"*n")
	X2[cc] = read(handle,"*n")
	X3[cc] = read(handle,"*n")
	X4[cc] = read(handle,"*n")
	X5[cc] = read(handle,"*n")
	X6[cc] = read(handle,"*n")
	X7[cc] = read(handle,"*n")
	X8[cc] = read(handle,"*n")
	X9[cc] = read(handle,"*n")
	X10[cc] = read(handle,"*n")
	X11[cc] = read(handle,"*n")
	X12[cc] = read(handle,"*n")
	X13[cc] = read(handle,"*n")
	X14[cc] = read(handle,"*n")
	X15[cc] = read(handle,"*n")
	X16[cc] = read(handle,"*n")
	cc = cc + 1;
end
closefile(handle)

Bp = {}
IronVol = {}
MagnetVol = {}
cc = 0
while cc < nind do
	x1 = X1[cc]
	x2 = X2[cc]
	x3 = X3[cc]
	x4 = X4[cc]
	x5 = X5[cc]
	x6 = X6[cc]
	x7 = X7[cc]
	x8 = X8[cc]
	x9 = X9[cc]
	x10 = X10[cc]
	x11 = X11[cc]
	x12 = X12[cc]
	x13 = X13[cc]
	x14 = X14[cc]
	x15 = X15[cc]
	x16 = X16[cc]

-- Create the file and set problem definitions
	create(0)
	frequency = 0
	units = "millimeters"
	type = "axi"
	precision = 1E-8
	mi_probdef(frequency,units,type,precision)
	mi_saveas(femfile)

-- Define materials
	mi_addmaterial("Air", 1, 1, 0, 0, 0, 0)
	mi_addmaterial("Magnet", 1.886, 1.886, 191262, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1)
	mi_addmaterial("Iron", 14782, 14782, 0, 0, 0, 10.44, 0, 1, 1, 0, 0, 0)
	
	
-- Define the nonlinear B-H curve for the "Iron" blocks:
	mi_addbhpoint("Iron",0.000000, 0.000000)  
	mi_addbhpoint("Iron",0.227065, 13.898400) 
	mi_addbhpoint("Iron",0.454130, 27.796700)
	mi_addbhpoint("Iron",0.681195, 42.397400)
	mi_addbhpoint("Iron",0.908260, 61.415700)
	mi_addbhpoint("Iron",1.135330, 82.382400)
	mi_addbhpoint("Iron",1.362390, 144.669000)
	mi_addbhpoint("Iron",1.589350, 897.760000)
	mi_addbhpoint("Iron",1.812360, 4581.740000)
	mi_addbhpoint("Iron",2.010040, 17736.200000)
	mi_addbhpoint("Iron",2.133160, 41339.300000)
	mi_addbhpoint("Iron",2.199990, 68321.800000)
	mi_addbhpoint("Iron",2.254790, 95685.500000)
	mi_addbhpoint("Iron",2.299930, 123355.000000)
	mi_addbhpoint("Iron",2.342510, 151083.000000)
	mi_addbhpoint("Iron",2.378760, 178954.000000)
	mi_addbhpoint("Iron",2.415010, 206825.000000)
	mi_addbhpoint("Iron",2.451260, 234696.000000)
	mi_addbhpoint("Iron",2.487500, 262568.000000)
	mi_addbhpoint("Iron",2.523750, 290439.000000)
	mi_addbhpoint("Iron",2.560000, 318310.000000)


-- Define the nonlinear B-H curve for the "Magnet" blocks:
    mi_addbhpoint("Magnet",0.000000,0.000000)
    mi_addbhpoint("Magnet",0.100348,8233.883925)
    mi_addbhpoint("Magnet",0.148760,16191.633925)
    mi_addbhpoint("Magnet",0.159921,24149.383925)
    mi_addbhpoint("Magnet",0.171082,32107.133925)
    mi_addbhpoint("Magnet",0.182244,40064.883925)
    mi_addbhpoint("Magnet",0.193405,48022.633925)
    mi_addbhpoint("Magnet",0.204566,55980.383925)
    mi_addbhpoint("Magnet",0.215728,63938.133925)
    mi_addbhpoint("Magnet",0.226889,71895.883925)
    mi_addbhpoint("Magnet",0.238050,79853.633925)
    mi_addbhpoint("Magnet",0.249211,87811.383925)
    mi_addbhpoint("Magnet",0.260373,95769.133925)
    mi_addbhpoint("Magnet",0.271534,103726.883925)
    mi_addbhpoint("Magnet",0.282695,111684.633925)
    mi_addbhpoint("Magnet",0.293856,119642.383925)
    mi_addbhpoint("Magnet",0.305018,127600.133925)
    mi_addbhpoint("Magnet",0.316179,135557.883925)
    mi_addbhpoint("Magnet",0.327340,143515.633925)
    mi_addbhpoint("Magnet",0.338501,151473.383925)
    mi_addbhpoint("Magnet",0.349663,159431.133925)
    mi_addbhpoint("Magnet",0.360824,167388.883925)
    mi_addbhpoint("Magnet",0.371985,175346.633925)
    mi_addbhpoint("Magnet",0.383147,183304.383925)
    mi_addbhpoint("Magnet",0.394308,191262.133925)

-- Draw the loudspeaker configuration
-- Define node coordinates

    -- bottom block
	px1, py1 = x1, 0
	px2, py2 = px1, x6 + x7 + x11 + x15+ x16
	px3, py3 = px1 + x12 + x8, py2
	px4, py4 = px3, x7 + x15 + x16
	px5, py5 = x1 + x12, min(x7 + x13 + x16, py4)
	px6, py6 = px5, x7 + x16
	px7, py7 = x1 + x3 + x4 + x12 + x8 + x9 + x14, py6
	px8, py8 = px7, x16
	px9, py9 = x1 + x5, py8
	px10, py10 = px9, 0

    -- top block
	px11, py11 = x1 + x12 + x8 + x9, x11 + x6 + x7 + x15+ x16
	px12, py12 = x1 + x12 + x8 + x9 + x2, py11
	px13, py13 = px12, x6 + x7 + x15+ x16
	px14, py14 = x1 + x3 + x12 + x8 + x9 + x10 + x14, py13
	px15, py15 = px14, x7 + x15+ x16
	px16, py16 = x1 + x12 + x8 + x9, py15

    -- magnet
	px17, py17 = x1 + x12 + x8 + x9 + x3, x7 + x15+ x16
	px18, py18 = px17, x7 + x16
	px19, py19 = x1 + x3 + x12 + x8 + x9 + x14, py18
	px20, py20 = px19, x7 + x15 + x16

-- Draw Nodes
	mi_addnode(px1,py1)
	mi_addnode(px2,py2)
	mi_addnode(px3,py3)
	mi_addnode(px4,py4)
	mi_addnode(px5,py5)
	mi_addnode(px6,py6)
	mi_addnode(px7,py7)
	mi_addnode(px8,py8)
	mi_addnode(px9,py9)
	mi_addnode(px10,py10)
	mi_addnode(px11,py11)
	mi_addnode(px12,py12)
	mi_addnode(px13,py13)
	mi_addnode(px14,py14)
	mi_addnode(px15,py15)
	mi_addnode(px16,py16)
	mi_addnode(px17,py17)
	mi_addnode(px18,py18)
	mi_addnode(px19,py19)
	mi_addnode(px20,py20)


-- Conects the nodes with segments
-- Main block of iron
	mi_addsegment(px1,py1,px2,py2)
	mi_addsegment(px2,py2,px3,py3)
	mi_addsegment(px3,py3,px4,py4)
	mi_addsegment(px4,py4,px5,py5)
	mi_addsegment(px5,py5,px6,py6)
	mi_addsegment(px6,py6,px7,py7)
	mi_addsegment(px7,py7,px8,py8)
	mi_addsegment(px8,py8,px9,py9)
	mi_addsegment(px9,py9,px10,py10)
	mi_addsegment(px10,py10,px1,py1)
	
	mi_addblocklabel(x1 + 0.05, 0.05)
	mi_selectlabel(x1 + 0.05, 0.05)
	mi_setblockprop("Iron", 1, 0.05, "none", 0, 0, 0)
	mi_clearselected()

-- Magnet
	mi_addsegment(px17,py17,px18,py18)
	mi_addsegment(px18,py18,px19,py19)
	mi_addsegment(px19,py19,px20,py20)
      mi_addsegment(px20,py20,px17,py17)
	
	mi_addblocklabel(px17 + 0.05, py17 - 0.05)
	mi_selectlabel(px17 + 0.05, py17 - 0.05)
	mi_setblockprop("Magnet", 1, 0.05, "none", 90, 0, 0)
	mi_clearselected()
	
	
-- Upper block of iron
	mi_addsegment(px11,py11,px12,py12)
	mi_addsegment(px12,py12,px13,py13)
	mi_addsegment(px13,py13,px14,py14)
	mi_addsegment(px14,py14,px15,py15)
	mi_addsegment(px15,py15,px16,py16)
      mi_addsegment(px16,py16,px11,py11)
	
	mi_addblocklabel(px11 + 0.05, py11 - 0.05)
	mi_selectlabel(px11 + 0.05, py11 - 0.05)
	mi_setblockprop("Iron", 1, 0.05, "none", 0, 0, 0)
	mi_clearselected()
	
	
-- Draw the Air domain
	
-- Draw simulation space
mi_addnode(0,100)
mi_addnode(0,-75)
mi_addarc(0,-75,0,100,180,2.5)
mi_addsegment(0,-75,0,100)
mi_addblocklabel(0.1, 0.1)
mi_selectlabel(0.1, 0.1)
mi_setblockprop("Air", 1, 0.1, "none", 0, 0, 0)
mi_clearselected()
	
	
-- Define the boundary conditions
u0 = 4*3.141592*0.0000001 -- vacuum permeability
ur = 1                    -- relative permeability of the air
R = 0.0875                -- radius of the analysis region (in meters)        
c0 = 1/(ur*u0*R)          -- constants for the Open Boundary condition
c1 = 0
mi_addboundprop("Open", 0, 0, 0, 0, 0, 0, c0, c1, 2)
mi_selectarcsegment(87.5, 0)
mi_setarcsegmentprop(2.5,"Open", 0, "none")
mi_clearselected()
	
	
--mi_zoomnatural()
	
-- Save file and analyze
	mi_saveas(femfile)
	mi_analyze(1)     -- (0) show the fkern window, (1) hide the fkern window
	mi_loadsolution()
	
	
-- Run postprocessor to harvest results

-- get the flux in the air gap
    mo_selectpoint(px16, py16)
    mo_selectpoint(px11, py11)
    btot, Bp[cc] = mo_lineintegral(0)

-- Get the Iron volume
    IronVol[cc] = 0;
    MagnetVol[cc] = 0;
    mo_selectblock(x1 + 0.05, 0.05)
    re = mo_blockintegral(10)
    IronVol[cc] = IronVol[cc] + re
    mo_clearblock()
    
    mo_selectblock(px11 + 0.05, py11 - 0.05)
    re = mo_blockintegral(10)
    IronVol[cc] = IronVol[cc] + re
    mo_clearblock()

-- Get the Magnet Volume
    mo_selectblock(px17 + 0.05, py17 - 0.05)
    re, im = mo_blockintegral(10)
    MagnetVol[cc] = MagnetVol[cc] + re
    mo_clearblock()
	
    cc = cc + 1
    
-- Close
    mo_close()
    mi_close()
		
end
	
-- write results to disk
-- file will have the value of the magnetic field at the center of the air gap region, in Teslas

handle = openfile(outfile,"w")
cc = 0
while cc < nind do
	write(handle,Bp[cc],"\n")
	cc = cc + 1
end

-- the volume of Iron in cubic meters
cc = 0;
while cc < nind do
	write(handle,IronVol[cc],"\n")
	cc = cc + 1
end

-- and the volume of the Magnet, also in cubic meters
cc = 0;
while cc < nind do
	write(handle,MagnetVol[cc],"\n")
	cc = cc + 1
end

closefile(handle)
quit()
