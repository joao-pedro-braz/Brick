baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
			preLoadDoIt:  #preLoadActions:;
		   baseline: 'Bloc' with: [ spec
				postLoadDoIt: #postLoadBloc:;
				loads: #(stub); "Stub does not load anything here. We load Bloc in postLoadBloc:"
				repository: 'github://pharo-graphics/Bloc/src' ];

			project: 'PetitCSS' with: [ spec
				className: #ConfigurationOfPetitCSS;
				versionString: '1.1';
				repository: 'http://smalltalkhub.com/mc/GlennCavarle/PetitCSS/main/' ];
			
			package: #Brick with: [ spec requires: #('Bloc'). ];
			package: #'Brick-Style' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Theme' with: [ spec requires: #('Brick-Style' ). ];
			package: #'Brick-Material' with: [ spec requires: #('Brick-Theme' ). ];
			package: #'Brick-UI' with: [ spec requires: #(#Brick  'Brick-Theme'). ];
			package: #'Brick-Editor' with: [ spec requires: #(Brick 'Brick-Theme'). ];
			package: #'Brick-Editor-Extensions' with: [ spec requires: #(Brick 'Brick-Theme' 'Brick-Editor'). ];
			package: #'Brick-Sparta' with: [ spec requires: #(Brick 'Brick-Theme'). ];
			package: #'Brick-Examples' with: [ spec requires: #('Brick-UI' 'Brick-Material'). ];
			package: #'Brick-Experimental' with: [ spec requires: #('Brick-UI' 'Brick-Material'). ];
			
			"default groups"
			group: 'core' with: #(
				'Brick-UI'
				'Brick-Examples'
				'Brick-Editor'
				'Brick-Editor-Extensions'
				'Brick-Sparta'
				'Brick-Experimental');
				
			group: 'development' with: #('core');

			group: 'stub' with: #();
			group: 'default' with: #('core')
			
		].