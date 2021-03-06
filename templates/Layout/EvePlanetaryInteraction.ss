<div class="content-container">
    <article>
        <h1>$Title</h1>
        <div class="content">
            $Content
		<script type="text/javascript">
            /*
             *  i did not write this js disgrace. L2DOM bro.
             *  just did some painstaking mods to it
             *  please do not give me credit for this one -dnz
             */
		
			// Init Functions
			
			function Init(){
				ingame = (typeof CCPEVE == 'undefined') ? 0 : 1;
				
				GlobalVarsInit()
				SetRelations()
			
				ctx = document.getElementById('canvas').getContext('2d');  
				
				img.src = '/mysite/images/pi780.jpg';	

				img.onload = function(){
					ImageLoaded = 1
					redraw()
				}
			}
			
			function GlobalVarsInit(){
				MouseArea = 0
				SelectedCommodity = -1
				SelectedPlanet = -1
				Mplanet = -1
				ImageLoaded = 0
				DrawMode = 0
				waitForKeyRelease = 0

				img = new Image();
				
				White = 'rgba(255,255,255,1)'
				
				SelectedColor = 'rgba(255,222,0,0.4)'
				SelectedColorTame = 'rgba(255,222,0,0.4)'
				ComposantColor = 'rgba(0,221,0,0.3)'
				
				Mark1Color = 'rgba(0,100,255,0.3)'; 
				Mark2Color = 'rgba(255,0,0,0.3)'; 
				Mark3Color = 'rgba(128,0,255,0.3)';
				Mark4Color = 'rgba(0,255,255,0.3)';
				Mark5Color = 'rgba(219,219,219,0.3)';		
				
				PlanetButtonWidth = 136
				PlanetButtonTop = 768
				PlanetButtonHeight = 24
				
				RMleft = 24
				RMtop = 24
				RMbottom = 744
				RMright = 159
				
				PMleft = 183
				PMtop = 24
				PMbottom = 744
				PMright = 318
				
				RC1left = 342
				RC1top = 96
				RC1bottom = 672
				RC1right = 477
				
				RC2left = 477
				RC2top = 96
				RC2bottom = 672
				RC2right = 612
				
				SC1left = 636
				SC1top = 120
				SC1bottom = 648
				SC1right = 771

				SC2left = 771
				SC2top = 145//193
				SC2bottom = 624
				SC2right = 906//1208
				
				AC1left = 930//1240
				AC1top = 192//256
				AC1bottom = 576//768
				AC1right = 1065//1420		

				CaseHeight = 48
				CaseWidth = 135
				
				PlanetPathArray = new Array(83)
				for(i=0;i<=82;i++){
					PlanetPathArray[i] = 0
				}
			
				PlanetMaskPathArray = new Array(83)
				for(i=0;i<=82;i++){
					PlanetMaskPathArray[i] = 1
				}		

				ActivePlanets = new Array(8)
				for(i=0;i<=7;i++){
					ActivePlanets[i] = 1
				}				
			}
			
			function SetRelations(){
							
				Planet = new Array(8)
				
				Planet[0] = barrenP = new Array(5)
				barrenP[0] = 68
				barrenP[1] = 70
				barrenP[2] = 71
				barrenP[3] = 76
				barrenP[4] = 78
				Planet[1] = gasP = new Array(5)
				gasP[0] = 68
				gasP[1] = 70
				gasP[2] = 75
				gasP[3] = 77
				gasP[4] = 81
				Planet[2] = iceP = new Array(5)
				iceP[0] =68
				iceP[1] =74
				iceP[2] =76
				iceP[3] =77
				iceP[4] =80
				Planet[3] = lavaP = new Array(5)
				lavaP[0] =70
				lavaP[1] =73
				lavaP[2] =74
				lavaP[3] =79
				lavaP[4] =82
				Planet[4] = oceanicP = new Array(5)
				oceanicP[0] =68
				oceanicP[1] =71
				oceanicP[2] =72
				oceanicP[3] =76
				oceanicP[4] =80
				Planet[5] = plasmaP = new Array(5)
				plasmaP[0] =70
				plasmaP[1] =74
				plasmaP[2] =78
				plasmaP[3] =79
				plasmaP[4] =82
				Planet[6] = stormP = new Array(5)
				stormP[0] =68
				stormP[1] =70
				stormP[2] =75
				stormP[3] =77
				stormP[4] =82
				Planet[7] = temperateP = new Array(5)
				temperateP[0] =68
				temperateP[1] =69
				temperateP[2] =71
				temperateP[3] =72
				temperateP[4] =76
				
				
				TypeIdArray = new Array(83)
				
				//aqueous liquid 
				TypeIdArray[68] = 2268
				//autotroph
				TypeIdArray[69] = 2305
				//Base Metals  
				TypeIdArray[70] = 2267
				//Carbon Compounds 
				TypeIdArray[71] = 2288
				//Complex Organisms
				TypeIdArray[72] = 2287
				//  Felsic Magma
				TypeIdArray[73] = 2307
				//  Heavy Metals
				TypeIdArray[74] = 2272
				//  Ionic Solutions
				TypeIdArray[75] = 230
				//  Micro Organisms
				TypeIdArray[76] = 2073
				//  Noble Ga
				TypeIdArray[77] = 2310
				//Noble Metals
				TypeIdArray[78] = 2270
				//  Non-CS Crystals
				TypeIdArray[79] = 2306
				//  Planktic Colonies
				TypeIdArray[80] = 2286
				//  Reactive Gas
				TypeIdArray[81] = 2311
				//  Suspended Plasma
				TypeIdArray[82] = 2308

				//Bacteria
				TypeIdArray[0] = 2393
				//Biofuels
				 TypeIdArray[1] = 2396
				//Biomass
				 TypeIdArray[2] = 3779
				//Chiral Structures
				 TypeIdArray[3] = 2401
				//Electrolytes
				 TypeIdArray[4] = 2390
				//Industrial Fibers
				TypeIdArray[5] = 2397
				 // Oxidizing Compound
				 TypeIdArray[6] = 2392
				//Oxygen
				 TypeIdArray[7] = 3683
				//Plasmoids 3683
				TypeIdArray[8] = 2389
				 // Precious Metals
				 TypeIdArray[9] = 2399
				//Proteins
				 TypeIdArray[10] = 2395			
				//Reactive Metals
				 TypeIdArray[11] = 2398
				//Silicon
				 TypeIdArray[12] = 9828
				//Toxic Metals
				TypeIdArray[13] = 2400
				// Water
				TypeIdArray[14] = 3645			
				
				//Biocells
				TypeIdArray[15] = 2329
				 // Construction Blocks
				TypeIdArray[16] = 3828
				 // Consumer Electronics
				TypeIdArray[17] = 9836
				//  Coolant
				TypeIdArray[18] = 9832
				 // Enriched Uranium
				TypeIdArray[19] = 44
				 // Fertilizer
				TypeIdArray[20] = 3693
				//  Genetically Enhanced Livestock
				TypeIdArray[21] = 15317
				//  Livestock
				TypeIdArray[22] = 3725
				//  Mechanical Parts
				TypeIdArray[23] = 3689
				 // Microfiber Shielding
				TypeIdArray[24] = 2327
				 // Miniature Electronics
				TypeIdArray[25] = 9842
				//  Nanites
				TypeIdArray[26] = 2463
				//  Oxides
				TypeIdArray[27] = 2317
				 // Polyaramids
				TypeIdArray[28] = 2321
				 // Polytextiles
				TypeIdArray[29] = 3695
				 // Rocket Fuel
				TypeIdArray[30] = 9830
				//  Silicate Glass
				TypeIdArray[31] = 3697
				  //Superconductors
				TypeIdArray[32] = 9838
				//  Supertensile Plastics
				TypeIdArray[33] = 2312
				//  Synthetic Oil
				TypeIdArray[34] = 3691
				//  Test Cultures
				TypeIdArray[35] = 2319
				//  Transmitter
				TypeIdArray[36] = 9840
				//  Viral Agent
				TypeIdArray[37] = 3775
				 // Water-Cooled CPU
				TypeIdArray[38] = 2328		

				//Biotech Research Reports
				TypeIdArray[39] = 2358
				 // Camera Drones
				TypeIdArray[40] = 2345
				 // Condensates
				TypeIdArray[41] = 2344
				 // Cryoprotectant Solution
				TypeIdArray[42] = 2367
				//  Data Chips
				TypeIdArray[43] = 17392
				//  Gel-Matrix Biopaste
				TypeIdArray[44] = 2348
				//  Guidance Systems
				TypeIdArray[45] = 9834
				//  Hazmat Detection Systems
				TypeIdArray[46] = 2366
				 // Hermetic Membranes
				TypeIdArray[47] = 2361
				// highttech transmiters
				TypeIdArray[48] = 17898
				//  Industrial Explosives
				TypeIdArray[49] = 2360
				//  Neocoms
				TypeIdArray[50] = 2354
				//  Nuclear Reactors
				TypeIdArray[51] = 2352
				//  Planetary Vehicles
				TypeIdArray[52] = 9846
				//  Robotics
				TypeIdArray[53] = 9848
				//  Smartfab Units
				TypeIdArray[54] = 2351
				//  Supercomputers
				TypeIdArray[55] = 2349
				//  Synthetic Synapses
				TypeIdArray[56] = 2346
				//  Transcranial Microcontrollers
				TypeIdArray[57] = 12836
				//  Ukomi Super Conductors
				TypeIdArray[58] = 17136
				//  Vaccines
				TypeIdArray[59] = 28974			
				
				//broadcast node
				TypeIdArray[60] = 2867
				//integrity response drones
				TypeIdArray[61] = 2868
				//nano-factory
				TypeIdArray[62] = 2869
				//organic mortar applicators
				TypeIdArray[63] = 2870
				//recursive computing module
				TypeIdArray[64] = 2871
				//self-harmonizing power core
				TypeIdArray[65] = 2872
				//sterile conduits
				TypeIdArray[66] = 2875
				//wetware mainframe
				TypeIdArray[67] = 2876			
				
				CommodityPathArray = new Array(83)
				for(i = 0;i < 83;i++)
				{
					CommodityPathArray[i] = 0
				}			
				
				//Commodities Relations
				CommodityArray = new Array(83)
				for(i = 0;i < 83;i++)
				{
					CommodityArray[i] = new Array(83)
								
					for(j = 0;j < 83;j++)
					{
						CommodityArray[i][j] = 0
					}
					
					CommodityArray[i][i] = -1
				}
				
				//Aqueous liquid
				CommodityArray[68][14]=3
				//autotrophs
				CommodityArray[69][5]=3
				//base metals
				CommodityArray[70][11]=3
				//carbon compounds
				CommodityArray[71][1]=3
				//complex organism
				CommodityArray[72][10]=3
				//felsic magma
				CommodityArray[73][12]=3
				//heavy metals
				CommodityArray[74][13]=3
				//ionic solutions
				CommodityArray[75][4]=3
				//micro organisms
				CommodityArray[76][0]=3
				//noble gas
				CommodityArray[77][7]=3
				//noble metals
				CommodityArray[78][9]=3
				//non-cs crystals
				CommodityArray[79][3]=3
				//planktic colonies
				CommodityArray[80][2]=3
				//reactive gas
				CommodityArray[81][6]=3
				//suspended plasma
				CommodityArray[82][8]=3

				
				//Bacteria
				
				CommodityArray[0][20]=3
				CommodityArray[0][26]=3
				CommodityArray[0][35]=3
				CommodityArray[0][37]=3
				CommodityArray[0][63]=3
				
				//Biofuels
				
				CommodityArray[1][15]=3
				CommodityArray[1][22]=3
				CommodityArray[1][29]=3
				
				//Biomass
				
				CommodityArray[2][21]=3
				CommodityArray[2][37]=3	
				CommodityArray[2][33]=3	

				//Chiral Structures
				
				CommodityArray[3][17]=3
				CommodityArray[3][25]=3
				CommodityArray[3][36]=3

				//Electrolytes
				
				CommodityArray[4][18]=3
				CommodityArray[4][30]=3
				CommodityArray[4][34]=3		

				//Industrial Fiber
				
				CommodityArray[5][24]=3
				CommodityArray[5][28]=3
				CommodityArray[5][29]=3	

				//Oxidizing Coumpound
				
				CommodityArray[6][28]=3
				CommodityArray[6][27]=3
				CommodityArray[6][31]=3			

				//Oxygen
				
				CommodityArray[7][34]=3
				CommodityArray[7][33]=3
				CommodityArray[7][27]=3		

				//Plasmoids
				
				CommodityArray[8][32]=3
				CommodityArray[8][30]=3
				CommodityArray[8][36]=3		
				
				//Precious metals
				
				CommodityArray[9][15]=3
				CommodityArray[9][19]=3
				CommodityArray[9][23]=3		
				
				//Proteins
				
				CommodityArray[10][20]=3
				CommodityArray[10][21]=3
				CommodityArray[10][22]=3	

				//Reactive metals
				
				CommodityArray[11][16]=3
				CommodityArray[11][26]=3
				CommodityArray[11][23]=3
				CommodityArray[11][38]=3
				CommodityArray[11][62]=3

				//Silicon
				
				CommodityArray[12][31]=3
				CommodityArray[12][25]=3
				CommodityArray[12][24]=3

				//Toxic metals
				
				CommodityArray[13][16]=3
				CommodityArray[13][17]=3
				CommodityArray[13][19]=3
				
				//Water
				
				CommodityArray[14][35]=3
				CommodityArray[14][38]=3
				CommodityArray[14][18]=3
				CommodityArray[14][32]=3
				CommodityArray[14][66]=3

				
				//Biocells
				CommodityArray[15][44]=3
				CommodityArray[15][50]=3
				CommodityArray[15][57]=3
				//Constr block
				CommodityArray[16][54]=3
				CommodityArray[16][39]=3
				//consmr elec
				CommodityArray[17][55]=3
				CommodityArray[17][53]=3
				//coolant
				CommodityArray[18][41]=3
				CommodityArray[18][55]=3
				//enr uranium
				CommodityArray[19][51]=3
				//fertilizer
				CommodityArray[20][49]=3
				CommodityArray[20][42]=3
				//GE livestock
				CommodityArray[21][47]=3
				//livestock
				CommodityArray[22][39]=3
				CommodityArray[22][59]=3
				//mech parts
				CommodityArray[23][53]=3
				CommodityArray[23][52]=3
				//microfiber shielding
				CommodityArray[24][51]=3
				CommodityArray[24][43]=3
				//miniature electronic
				CommodityArray[25][54]=3
				CommodityArray[25][52]=3
				//nanites
				CommodityArray[26][39]=3
				CommodityArray[26][57]=3
				//oxides
				CommodityArray[27][41]=3
				CommodityArray[27][44]=3
				//polyaramids
				CommodityArray[28][48]=3
				CommodityArray[28][47]=3
				//polytextiles
				CommodityArray[29][49]=3
				CommodityArray[29][46]=3
				//rocket fuel
				CommodityArray[30][40]=3
				//silicate glass
				CommodityArray[31][40]=3
				CommodityArray[31][50]=3
				//super conductors
				CommodityArray[32][58]=3
				CommodityArray[32][44]=3
				//super tensil plastics
				CommodityArray[33][56]=3
				CommodityArray[33][52]=3
				CommodityArray[33][43]=3
				//synth oil
				CommodityArray[34][58]=3
				CommodityArray[34][42]=3
				//test cultures
				CommodityArray[35][56]=3
				CommodityArray[35][42]=3
				//transmitter
				CommodityArray[36][48]=3
				CommodityArray[36][45]=3
				CommodityArray[36][46]=3
				//viral agent
				CommodityArray[37][59]=3
				CommodityArray[37][46]=3
				//water cooled CPU
				CommodityArray[38][55]=3
				CommodityArray[38][45]=3

				
				//biotech research reports
				CommodityArray[39][67]=3
				//camera drone
				CommodityArray[40][65]=3
				//condensates
				CommodityArray[41][63]=3
				//ryoprotectant solution
				CommodityArray[42][67]=3
				//datachips
				CommodityArray[43][60]=3
				//gel matrix biopaste
				CommodityArray[44][61]=3
				//guidance system
				CommodityArray[45][64]=3
				//hazmat detector
				CommodityArray[46][61]=3
				//hermetic membrane
				CommodityArray[47][65]=3
				//high-tech transmitters
				CommodityArray[48][60]=3
				//industrial explosives
				CommodityArray[49][62]=3
				//neocoms
				CommodityArray[50][60]=3
				//nuclear reactors
				CommodityArray[51][65]=3
				//planetary vehicles
				CommodityArray[52][61]=3
				//robotics
				CommodityArray[53][63]=3
				//smartfab unit
				CommodityArray[54][66]=3
				//supercomputers
				CommodityArray[55][67]=3
				//synthetic synapses
				CommodityArray[56][64]=3
				//trancranial microcontroler
				CommodityArray[57][64]=3
				//ukomi superconductors
				CommodityArray[58][62]=3
				//vaccines
				CommodityArray[59][66]=3
				
				
				for(i=0;i<68;i++){
					CompScan(i,i,i)
																		
					for(j=0;j<83;j++){
					
						if(j < 15) jCommodityTier = 1
						else if(j < 39) jCommodityTier = 2
						else if(j < 60) jCommodityTier = 3
						else if(j < 68) jCommodityTier = 4
						else if(j < 83) jCommodityTier = 0
						
						if(i < 15) iCommodityTier = 1
						else if(i < 39) iCommodityTier = 2
						else if(i < 60) iCommodityTier = 3
						else if(i < 68) iCommodityTier = 4
						else if(i < 83) iCommodityTier = 0
						
						if(jCommodityTier >= iCommodityTier) continue
						
						CommodityArray[i][j] = CommodityArray[i][j] * Math.pow(2,iCommodityTier-jCommodityTier-1)
						
					}								
				}

				if(i=62) CommodityArray[62][11] += -2 ; CommodityArray[62][70] += -4
				if(i=63) CommodityArray[63][0] += -2 ; CommodityArray[63][76] += -4
				if(i=66) CommodityArray[66][14] += -2 ; CommodityArray[66][68] += -4
				
				for(i=0;i<83;i++){
					ColorShift = 1
					
					for(j=0;j<83;j++){
						//if(i==j) continue
						if(CommodityArray[i][j] == 3){
							CommodityArray[i][j] += ColorShift
							if(i>67) continue
							for(k=0;k<83;k++){
								if(k==i || k==j) continue
								if(CommodityArray[k][j] >= 3 && CommodityArray[k][j] <= 10){
									
									CommodityArray[i][k] = 10+ColorShift
								}
							}
							ColorShift++
						}
					}
					
				}		
			}
			
			
			
			
			// Relations calculation Functions		
			
			function calculatePlanetPathArray(){
				for(i=0;i<83;i++){
					PlanetPathArray[i] = 0
				}
				
				for(i=0;i<8;i++){
					PlanetPathArray[Planet[SelectedPlanet][i]] = 1
				}
				
				calculatePathArray(PlanetPathArray)
			}
			
			function calculatePlanetMaskPathArray(){
				for(i=0;i<83;i++){
					PlanetMaskPathArray[i] = 0
				}
			
			
				for(i=0;i<8;i++){
					if(ActivePlanets[i] == 1) {
						for(j=0;j<5;j++){
							PlanetMaskPathArray[Planet[i][j]] = 1
						}
					}
				}
				
				calculatePathArray(PlanetMaskPathArray)
				
				//Deselect selected commodities that could conflict
				var i
				for(i=0;i<83;i++){
					if(PlanetMaskPathArray[i] == 0 && (CommodityPathArray[i] == 1 || CommodityPathArray[i] == 1.1 || CommodityPathArray[i] == 4 || CommodityPathArray[i] == 4.1) == 1){
						CommodityPathArray[i] = 0
						DrawMode--
						calculateCommodityPathArray()
					}
				}
				
				//advanced commodities can't be produced if there are no temperate or barren planets
				if(ActivePlanets[0]==0 && ActivePlanets[7]==0){
					for(i=60;i<68;i++){
						PlanetMaskPathArray[i] = 0
					}
				}
			}
			
			function CompScan(commodity,targetCommodity){
				var sc

				if(commodity < 15) SubCommodityTier = 0
				else if(commodity < 39) SubCommodityTier = 1
				else if(commodity < 60) SubCommodityTier = 2
				else if(commodity < 68) SubCommodityTier = 3
				else if(commodity < 83) SubCommodityTier = -1
				

				
				switch(SubCommodityTier){
				case 1: scStart = 0; scEnd = 15; break;
				case 2: scStart = 15; scEnd = 39; break;
				case 3: scStart = 39; scEnd = 60; break;
				case 0: scStart = 68; scEnd = 83; break;
				}
				
				

				if(SubCommodityTier != -1) {
					for(sc=scStart;sc<scEnd;sc++){
						if(CommodityArray[sc][commodity] == 3){
							CompScan(sc,targetCommodity)
						}						
					}					
				}				
				if(commodity != targetCommodity) CommodityArray[targetCommodity][commodity] += -2							
			}
			
			function calculateCommodityPathArray(){
				for(i=0;i<83;i++){
					if(CommodityPathArray[i] != 1) {
						if(CommodityPathArray[i] == 1.1 || CommodityPathArray[i] == 4 || CommodityPathArray[i] == 4.1) CommodityPathArray[i] = 1
						//else if(CommodityPathArray[i] == 2.1) CommodityPathArray[i] = 2
						//else if(CommodityPathArray[i] == 4) CommodityPathArray[i] = 1
						else CommodityPathArray[i] = 0
					}
				}
			
				calculatePathArray(CommodityPathArray)
				
				//Deselect selected commodities that could conflict
				var i
				for(i=0;i<83;i++){
					if(PlanetMaskPathArray[i] == 0 && (CommodityPathArray[i] == 1 || CommodityPathArray[i] == 1.1 || CommodityPathArray[i] == 4 || CommodityPathArray[i] == 4.1) == 1){
						CommodityPathArray[i] = 0
						DrawMode--
						//calculateCommodityPathArray()
					}
				}
			}			
			
			function calculatePathArray(PathArray){
				changed = 0
				for(i=0;i<83;i++){
					if(PathArray[i] > 0){
						for(j=0;j<83;j++){
							if(CommodityArray[i][j] > 3 && CommodityArray[i][j] < 10){			
								oldj = PathArray[j]
								for(k=0;k<83;k++){
									if((CommodityArray[i][k] - 7 == CommodityArray[i][j]) || CommodityArray[i][k] == -1){
										if((PathArray[k] > 0) ) {
											switch(PathArray[j]){
												case 0: PathArray[j] = 2; changed = 1; break
												case 1.1:
												case 1: PathArray[j] = 4; break
												case 2:
												case 2.1: break;
											}
										}
										else {
											PathArray[j] = oldj
											changed = 0
											break;
										}
									}
								}
								
								if((PathArray[j] == 4 || PathArray[j] == 2 || PathArray[j] == 2.1) && PathArray[i] == 1) PathArray[i] = 1.1
								if((PathArray[j] == 4 || PathArray[j] == 4.1 || PathArray[j] == 2 || PathArray[j] == 2.1) && PathArray[i] == 4) PathArray[i] = 4.1
								if((PathArray[j] == 4 || PathArray[j] == 2) && PathArray[i] == 2) PathArray[i] = 2.1
							}
						}
					}
					if(i == 82 && changed == 1){
						i = -1
						changed = 0
					}
				}
			}			

			function SetIOP(iop){
				
		   
				change = 0
				composantCount = 0
				iComposantArray = new Array(5)
				
				if(iop == 1) for(i=0;i<83;i++){	
					 
					if(CommodityArray[i][SelectedCommodity] > 3 && CommodityArray[i][SelectedCommodity] < 10){
						iComposantArray[composantCount] = i//
						composantCount++
					}
				}
				else if(iop == 0) for(i=0;i<83;i++){	
					 
					if(CommodityArray[SelectedCommodity][i] > 3 && CommodityArray[SelectedCommodity][i] < 10){
						iComposantArray[composantCount] = i//
						composantCount++
					}
				}
				else for(i=0;i<83;i++){	
					 
					if(CommodityArray[SelectedCommodity][i] > 10 /*|| CommodityArray[Mcase][i] == -1*/){
						iComposantArray[composantCount] = i//
						composantCount++
					}
				}					
				for(i=0;i<composantCount;i++){
					cp = iComposantArray[i]
					if(CommodityPathArray[cp] == 1 || CommodityPathArray[cp] == 1.1 || CommodityPathArray[cp] == 4 || CommodityPathArray[cp] == 4.1) continue
					else {
						CommodityPathArray[cp] = 1
						DrawMode++
						change = 1
					}
				}
				if(change){
					calculateCommodityPathArray()
					redraw()
				}
				else {
					for(i=0;i<composantCount;i++){
						cp = iComposantArray[i]
						CommodityPathArray[cp] = 0
						DrawMode--
					}	
					calculateCommodityPathArray()
					redraw()
				}					
			}						

			
			
			// Display Update Functions
			
			function redraw(){
				ctx = document.getElementById('canvas').getContext('2d');  

				if(ImageLoaded == 0){
					ctx.font = "14pt Arial,font-weight:bold";
					ctx.fillStyle = 'rgb(0,0,0)'
					ctx.textAlign = "start";
					ctx.fillText("Loading...", 15, 15);			
					return				
				}
				
				ctx.drawImage(img,0,0);

					//debug display
					/*ctx.fillStyle = White;
					ctx.textAlign = "end";
					ctx.fillText(SubArea, 1084, 760)*/
					

				// planet resources draw mode
				if(MouseArea >= 10 && MouseArea <= 20 && ActivePlanets[SelectedPlanet]==1) PlanetResRedraw()
				// mouse hover draw mode
				else if(!DrawMode && SelectedCommodity != -1) MouseHoverRedraw()					
				// selection draw mode
				else SelectionRedraw()
				
				
				// Color active planets buttons
				for(i=0;i<8;i++){
					if(ActivePlanets[i] == 1){
						if(i == SelectedPlanet) ctx.fillStyle = SelectedColor
						else ctx.fillStyle = ComposantColor
						
						ctx.fillRect(i * PlanetButtonWidth + 24,PlanetButtonTop,PlanetButtonWidth - 24,PlanetButtonHeight)

					}
				}
			}
			
			function PlanetResRedraw(){
			
				calculatePlanetPathArray()
				
				for(j=1;j<=7;j++){
					GetColumnPos(j)
					
					for(i=caseStart;i<caseEnd;i++){
					
						rectY = (i-caseStart) * CaseHeight
					
						// hide unselected commodities					
						if(PlanetMaskPathArray[i] == 0){
							HideCase(columnLeft,columnTop,rectY)
							continue
						}
						
						// highlight planet resources
						if(PlanetPathArray[i] != 0){
							if(j==1) ctx.fillStyle = SelectedColor;
							else ctx.fillStyle = Mark1Color;
							ctx.fillRect(columnLeft,columnTop+rectY,CaseWidth,CaseHeight);		
						}
					}
				}

			}
			
			function MouseHoverRedraw(){
				for(j=1;j<=7;j++){
					GetColumnPos(j)
					
					for(i=caseStart;i<caseEnd;i++){
					
						rectY = (i-caseStart) * CaseHeight
					
						// hide unselected commodities					
						if(PlanetMaskPathArray[i] == 0){
							HideCase(columnLeft,columnTop,rectY)
							continue
						}
												
						if(CommodityArray[SelectedCommodity][i] == 0) continue

						else if(CommodityArray[SelectedCommodity][i] > 3){							
							DrawMark(columnLeft,columnTop+rectY,CommodityArray[SelectedCommodity][i])

                            for(z=0;z<8;z++) {
                                if(Planet[z].indexOf(SelectedCommodity) !== -1) {
                                    ctx.fillStyle = SelectedColor
                                    ctx.fillRect(z * PlanetButtonWidth + 24,PlanetButtonTop,PlanetButtonWidth - 24,PlanetButtonHeight)
                                }
                            } 

						}	
						else if(CommodityArray[SelectedCommodity][i] < -1){
							ctx.fillStyle = ComposantColor
							Quantity = CommodityArray[SelectedCommodity][i] * commodityMultiplier * -1
							DrawQuantityRectangle(columnLeft,columnTop+rectY,Quantity)
						}					
						else if(CommodityArray[SelectedCommodity][i] == -1){
							DrawFrame(columnLeft,columnTop+rectY)
							
							if(SubArea == 1){
								ctx.fillStyle = SelectedColor;
								ctx.fillRect(columnLeft,columnTop+rectY,48,CaseHeight);
							}
     						ctx.fillStyle = SelectedColor;
							if(i>67) ctx.fillRect(columnLeft,columnTop+rectY,CaseWidth,CaseHeight);			
							else DrawQuantityRectangle(columnLeft,columnTop+rectY,commodityMultiplier)
						}						
					}
				}
			}
			
			function SelectionRedraw(){
				for(j=1;j<=7;j++){
					GetColumnPos(j)
					
					for(i=caseStart;i<caseEnd;i++){
					
						rectY = (i-caseStart) * CaseHeight
					
						// hide unselected commodities					
						if(PlanetMaskPathArray[i] == 0){
							HideCase(columnLeft,columnTop,rectY)
							continue
						}
						
							
						if(CommodityPathArray[i] == 1 || CommodityPathArray[i] == 4 || CommodityPathArray[i] == 4.1 || CommodityPathArray[i] == 1.1)	{ DrawFrame(columnLeft,columnTop+rectY) }
						
						if(CommodityPathArray[i] == 1 || CommodityPathArray[i] == 4 || CommodityPathArray[i] == 2)										{ ctx.fillStyle = Mark2Color }
						else if(CommodityPathArray[i] == 4.1 || CommodityPathArray[i] == 2.1)															{ ctx.fillStyle = SelectedColor }
						else if(CommodityPathArray[i] == 1.1)																							{ ctx.fillStyle = ComposantColor }
						else if(i == SelectedCommodity)																									{ ctx.fillStyle = Mark5Color }
						
						if(CommodityPathArray[i] > 0 || i == SelectedCommodity) 																		{ ctx.fillRect(columnLeft,columnTop+rectY,CaseWidth,CaseHeight) }
																			
						if(i == SelectedCommodity && CommodityPathArray[i] > 0) DrawIOP(columnLeft, columnTop)					
					}
				}
			}
			
			function GetColumnPos(ColumnNum){
				switch(ColumnNum){
				case 1: 
					commodityMultiplier = 1500
					caseStart = 68; caseEnd = 83;
					columnLeft = RMleft; columnTop = RMtop;
					break
				case 2: 
					commodityMultiplier = 20
					caseStart = 0; caseEnd = 15; 
					columnLeft = PMleft; columnTop = PMtop;
					break
				case 3: 
					commodityMultiplier = 5
					caseStart = 15; caseEnd = 27; 
					columnLeft = RC1left; columnTop = RC1top;
					break
				case 4: 
					commodityMultiplier = 5
					caseStart = 27; caseEnd = 39; 
					columnLeft = RC2left; columnTop = RC2top;
					break
				case 5: 
					commodityMultiplier = 3
					caseStart = 39; caseEnd = 50; 
					columnLeft = SC1left; columnTop = SC1top;
					break
				case 6: 
					commodityMultiplier = 3
					caseStart = 50; caseEnd = 60; 
					columnLeft = SC2left; columnTop = SC2top;
					break
				case 7: 
					commodityMultiplier = 1
					caseStart = 60; caseEnd = 68; 
					columnLeft = AC1left; columnTop = AC1top;
					break						
				}
				
			}
								
			function HideCase(columnLeft,columnTop,rectY){
				ctx.fillStyle = 'rgba(95,100,128,1)'//'rgba(65,100,128,1)';
				ctx.fillRect(columnLeft+1,columnTop+rectY+1,CaseWidth-2,CaseHeight-2);	
			}
			
			function DrawIOP(x,y){
				ctx.fillStyle = 'rgba(0,200,0,0.8)'
				ctx.fillRect(x+CaseWidth*(9/10),y+rectY,CaseWidth*(1/10),CaseHeight/2);	
				ctx.textAlign = "center";
				ctx.font = "14pt Arial,font-weight:bold";
				ctx.fillStyle = White
				ctx.fillText('I',x+CaseWidth*(9/10)+6,y+rectY+18);
	
				ctx.fillStyle = 'rgba(200,200,0,0.8)'
				ctx.fillRect(x+CaseWidth*(9/10),y+rectY+CaseHeight/2,CaseWidth*(1/10),CaseHeight/2);	
				ctx.textAlign = "center";
				ctx.font = "13pt Arial,font-weight:bold";
				ctx.fillStyle = White
				ctx.fillText('O',x+CaseWidth*(9/10)+6,y+rectY+CaseHeight/2+18);
				
				ctx.fillStyle = 'rgba(120,120,120,0.8)'
				ctx.fillRect(x+CaseWidth*(8/10),y+rectY+CaseHeight/4,CaseWidth*(1/10),CaseHeight/2);	
				ctx.textAlign = "center";
				ctx.font = "13pt Arial,font-weight:bold";
				ctx.fillStyle = White
				ctx.fillText('P',x+CaseWidth*(8/10)+6,y+rectY+CaseHeight/4+18);
											
			}
			
			function DrawFrame(x,y){
					ctx.strokeStyle ='rgba(255,255,0,0.7)'
					ctx.lineWidth = 4;
					ctx.beginPath();
					ctx.moveTo(x+3,y+3);
					ctx.lineTo(x+CaseWidth-3,y+3);
					ctx.lineTo(x+CaseWidth-3,y+CaseHeight-3);
					ctx.lineTo(x+3,y+CaseHeight-3);
					ctx.closePath()

					ctx.stroke();	
				}
							
			function DrawQuantityRectangle(x,y,Q){
					ctx.textAlign = "end";
					ctx.font = "14pt Arial,font-weight:bold";
					ctx.fillRect(x,y,CaseWidth,CaseHeight);
					ctx.fillStyle = White
					
					if(Q < 1000) ctx.fillText(Q, x+CaseWidth-6, y+29)
					else {
						Q=Q/1000
						Q=Q+'k'
						ctx.fillText(Q, x+CaseWidth-6, y+29);
					}
				}			
			
			function DrawMark(x,y,ColorShift){
					switch(ColorShift){
					default:
					case 4: MarkColor = Mark1Color; break;
					case 5: MarkColor = Mark2Color; break;
					case 6: MarkColor = Mark3Color; break;
					case 7: MarkColor = Mark4Color; break;
					case 8: MarkColor = Mark5Color; break;
					
					case 11: ctx.fillStyle = Mark1Color; break;
					case 12: ctx.fillStyle = Mark2Color; break;
					case 13: ctx.fillStyle = Mark3Color; break;
					case 14: ctx.fillStyle = Mark4Color; break;
					case 15: ctx.fillStyle = Mark5Color; break;
					}
					//ctx.fillStyle = MarkColorShift(ColorShift);
					
					if(ColorShift < 10) {
							
							var lingrad = ctx.createLinearGradient(x,0,x+CaseWidth,0);
							lingrad.addColorStop(0.3, SelectedColorTame);
							lingrad.addColorStop(0.7, MarkColor);
							
							ctx.fillStyle = 'rgb(0,0,0)' //Chrome need to have the previous transparency cleared somehow
							ctx.fillStyle = lingrad

							ctx.fillRect(x,y,CaseWidth,CaseHeight)
					}
					else {
						
						ctx.fillRect(x,y,CaseWidth,CaseHeight)
						//ctx.strokeRect(x+1,y+1,CaseWidth-2,CaseHeight-2)
					}
				}
			

						
			// Input Events functions	
			
			function onMouseClick(evt){
				
				if(MouseArea > 0){
					if(MouseArea <= 19) {
						if(ActivePlanets[SelectedPlanet] == 1) ActivePlanets[SelectedPlanet] = 0
						else ActivePlanets[SelectedPlanet] = 1
						
						calculatePlanetMaskPathArray()
						redraw()
					}
					else if(MouseArea <= 199){					
						switch(SubArea){
						case 0:
							if(CommodityPathArray[SelectedCommodity] <= 0 || CommodityPathArray[SelectedCommodity] == 2 || CommodityPathArray[SelectedCommodity] == 2.1) {
								CommodityPathArray[SelectedCommodity] = 1
								DrawMode++								
							}
							else if(CommodityPathArray[SelectedCommodity] == 1 || CommodityPathArray[SelectedCommodity] == 1.1 || CommodityPathArray[SelectedCommodity] == 4 || CommodityPathArray[SelectedCommodity] == 4.1){
								CommodityPathArray[SelectedCommodity] = 0
								DrawMode--
							}
							
							calculateCommodityPathArray()
							redraw()	
						break;
						
						case 1:
							if(ingame) CCPEVE.showMarketDetails(TypeIdArray[SelectedCommodity])					
							else { 
								TypeIdString = ''+TypeIdArray[SelectedCommodity]; 
								window.open('http://www.eve-central.com/home/quicklook.html?typeid='+TypeIdString); 
							}							
						break
						}
						
						if(DrawMode) switch(SubArea) {
						case 2:
							SetIOP(1)
						break
						
						case 3:
							SetIOP(0)
						break
						
						case 4:
							SetIOP(2)
						break
						}
					}
				}				
			}			

			function onMouseMove(evt){
				canvasX = jQuery("#canvas").offset().left;
				canvasY = jQuery("#canvas").offset().top;
			
				RmouseX = evt.pageX - canvasX
				RmouseY = evt.pageY - canvasY
			
				oldMouseArea = MouseArea
				MouseArea = GetMouseArea()
								
				if(MouseArea != oldMouseArea){
					if(SubArea == 1){
						document.body.style.cursor = 'pointer'
					}
					else {
						document.body.style.cursor = 'default'
					}				
		
					redraw()
				}
			}

			function keyup(e){
				waitForKeyRelease = 0
			}

			function keydown(e){
				//waitForKeyRelease = 1
			}

			function keypress(e){

				if(SelectedCommodity >= 0 && waitForKeyRelease == 0) {//KpMcase = GetMouseCase(e)
					if(e.charCode == 105) SetIOP(1) //iop = 1
					else if(e.charCode == 111) SetIOP(0) //iop = 0
					else if(e.charCode == 112) SetIOP(2) //iop = 2;
					else return
					
					waitForKeyRelease = 1
					

				}
			}			

			function GetMouseArea(){	
				// 0 = blue area
				// 10-17 = planet area
				// 100-182 = commodity area
				//   .1 = price link area
				//   .2 = I area
				//	 .3 = O area
				//	 .4 = P area
			
				MouseArea = 0
			
				if(RmouseY > 768 && RmouseY <= 792) { 
					Mplanet = Math.floor(RmouseX/136)
					
					MouseArea = Mplanet + 10
				}
				else { 
					for(i=1;i<=7;i++){
						switch(i){
						case 1: Colonne = 68;left = RMleft; right = RMright; topCHROME = RMtop; bottom = RMbottom; break // 'top' is a javascript reserved variable
						case 2: Colonne = 0;left = PMleft; right = PMright; topCHROME = PMtop; bottom = PMbottom; break
						case 3: Colonne = 15;left = RC1left; right = RC1right; topCHROME = RC1top; bottom = RC1bottom; break
						case 4: Colonne = 27;left = RC2left; right = RC2right; topCHROME = RC2top; bottom = RC2bottom; break
						case 5: Colonne = 39;left = SC1left; right = SC1right; topCHROME = SC1top; bottom = SC1bottom; break
						case 6: Colonne = 50;left = SC2left; right = SC2right; topCHROME = SC2top; bottom = SC2bottom; break
						case 7: Colonne = 60;left = AC1left; right = AC1right; topCHROME = AC1top; bottom = AC1bottom; break
						}
						
						if (RmouseX < right && RmouseX > left && RmouseY > topCHROME && RmouseY < bottom){
							
							mouseTY = RmouseY - topCHROME
							Case = Math.floor(mouseTY/CaseHeight)
							MouseArea = Case + Colonne + 100
							
							if(RmouseX < left+CaseHeight) MouseArea += 0.1;
							else if(RmouseX > left+(9/10)*CaseWidth) {
								CaseTop = (Case) * CaseHeight + topCHROME
								if(RmouseY < CaseTop + CaseHeight/2) MouseArea += 0.2;
								else MouseArea += 0.3
							}
							else if(RmouseX > left+(8/10)*CaseWidth) MouseArea += 0.4

							break
						}						
					}					
				}

				if(MouseArea >= 100) SelectedCommodity = Math.floor(MouseArea) - 100
				else SelectedCommodity = -1
				
				SubArea = MouseArea - Math.round(MouseArea)
				SubArea = SubArea.toFixed(1)
				SubArea = SubArea * 10
				
				SelectedPlanet = MouseArea - 10
				
				if(PlanetMaskPathArray[SelectedCommodity] == 0) SelectedCommodity = -1
				
				return MouseArea
			}
			
			jQuery(document).mousemove(onMouseMove);
			document.onkeypress = keypress;
			document.onkeyup= keyup;
			document.onkeydown= keydown;

		</script>
	
		<canvas id="canvas" width="1089" height="792"  onclick="onMouseClick(event)"></canvas>

		
		<script type="text/javascript">
				ctx = document.getElementById('canvas').getContext('2d');  
				ctx.font = "14pt Arial,font-weight:bold";
				ctx.fillStyle = 'rgb(0,0,0)'
				ctx.textAlign = "start";
				ctx.fillText("Loading...", 15, 15);				
				
                jQuery(function(){ Init() });	
		</script>
        </div>
    </article>
</div>

<% include SideBar %>
