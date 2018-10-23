# EAP18-0334
This repository contains the data needed for the analysis within the main paper in csv files as well as an R script detailing the analysis steps for the paper entitled "Intensive silviculture enhances biomass accumulation and tree diversity recovery in tropical forest restoration" by Brancalion, Pedro; Campoe, Otávio; Mendes, João Carlos; Noel, Camilla; Moreira, Gabriela; van Melis, Juliano; Stape, José Luiz; Guillemot, Joannès

Created by Juliano van Melis
It contains a series of scripts and functions explained below:

S1.r - script for executing piecewise Structural Equation Modeling.

S2.r - script for executing all other model analyses.

DataS1.csv - dataset to perform Piecewise Structural Equation Modeling for moist season
'cod': code of the plot. 1st Letter: 'A' for 50:50 proportion of pioneer and non-pioneer trees, 'B' for 67:33 proportion of pioneer and non-pioneer trees. 2nd Letter: '1' density of individuals equals to 3,333 trees/ha (3 x 1 m planting spacing), '2' density of individuals equals to 1,666 trees/ha (3 x 2 m planting spacing). 3rd letter: 'U' for usual fertilization/weed control” and 'X' for intensive fertilization/weed control  
'Block': experimental block
'Basal_Area': basal area of planted trees (log m2 values)
'Grass_cov': Grass cover data was collected in the wet season of 2016 (%)	
'density': density of colonizing woody species	(individuals per plot)
'richness': richness of colonizing woody species (species per plot)
'Canopy': percentage of photosynthetically active radiation intercepted by the canopy (iPAR, wavelength from 400 to 700 nm) 
'litter': litter deposited on the ground in the wet season of 2016. 

DataS2.csv - dataset to perform Piecewise Structural Equation Modeling for dry season
'cod': code of the plot. 1st Letter: 'A' for 50:50 proportion of pioneer and non-pioneer trees, 'B' for 67:33 proportion of pioneer and non-pioneer trees. 2nd Letter: '1' density of individuals equals to 3,333 trees/ha (3 x 1 m planting spacing), '2' density of individuals equals to 1,666 trees/ha (3 x 2 m planting spacing). 3rd letter: 'U' for usual fertilization/weed control” and 'X' for intensive fertilization/weed control  
'Block': experimental block
'Basal_Area': basal area of planted trees (log m2 values)
'Grass_cov': Grass cover data was collected in the wet season of 2016 (%)	
'density': density of colonizing woody species	(individuals per plot)
'richness': richness of colonizing woody species (species per plot)
'Canopy': percentage of photosynthetically active radiation intercepted by the canopy (iPAR, wavelength from 400 to 700 nm) 
'litter': litter deposited on the ground in the dry season of 2017.

DataS3.csv - dataset for Anhembi Experimental Station of Forest Sciences (details in the paper)
'date': sampling period, ranging from 1 to 14 (dd/mm/yyyy) = 01/04/2005, 01/02/2006, 01/07/2006, 22/01/2007, 26/07/2007, 01/03/2008, 01/11/2008, 05/04/2009, 24/10/2009, 27/03/2010, 20/04/2011, 24/07/2012, 24/07/2013, 10/01/2016.
'MNM': 	code of the plot. 1st Letter: 'A' for 50:50 proportion of pioneer and non-pioneer trees, 'B' for 67:33 proportion of pioneer and non-pioneer trees. 2nd Letter: '1' density of individuals equals to 3,333 trees/ha (3 x 1 m planting spacing), '2' density of individuals equals to 1,666 trees/ha (3 x 2 m planting spacing). 3rd letter: 'U' for usual fertilization/weed control” and 'X' for intensive fertilization/weed control. 
'Parcela': plot (sampling design)
'Bloco': design blocks (sampling design)
'TOTAL_WAGB': Above-ground woody biomass accumulation (log values)
'composicao', 'manejo', 'espaca`, and 'trata': columns stand for factorial design (as described in `MNM`).

Funding: 
- National Council for Scientific and Technological Development of Brazil (CNPq; grant #304817/2015-5); 
- São Paulo Research Foundation (FAPESP; grant # 2012/05814-3, #2013/50718-5). 

Support:
- Petrobras Company; 
- Forestry Science and Research Institute (IPEF);
- Experimental Station of Forest Sciences of the University of São Paulo (USP).
