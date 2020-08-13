Class {
	#name : #BaselineOfPharoDeprecationsCollector,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoDeprecationsCollector
}

{ #category : #baselines }
BaselineOfPharoDeprecationsCollector >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'ManualClassifier'
			with: [ spec repository: 'github://olekscode/ManualClassifier/src' ].
				
		"Packages"
		spec 
			package: 'PharoDeprecationsCollector';
			package: 'PharoDeprecationsCollector-Tests' with: [ spec requires: #(PharoDeprecationsCollector) ];
			package: 'PharoDeprecationsClassifier' with: [ spec requires: #(ManualClassifier PharoDeprecationsCollector) ] ].
]
