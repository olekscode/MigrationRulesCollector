Class {
	#name : #BaselineOfMigrationRulesCollector,
	#superclass : #BaselineOf,
	#category : #BaselineOfMigrationRulesCollector
}

{ #category : #baselines }
BaselineOfMigrationRulesCollector >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'ManualClassifier'
			with: [ spec repository: 'github://olekscode/ManualClassifier/src' ].
				
		"Packages"
		spec 
			package: 'MigrationRulesCollector';
			package: 'MigrationRulesCollector-Tests' with: [ spec requires: #(MigrationRulesCollector) ];
			package: 'MigrationRulesClassifier' with: [ spec requires: #(ManualClassifier MigrationRulesCollector) ] ].
]
