Class {
	#name : #BaselineOfMigrationRulesCollector,
	#superclass : #BaselineOf,
	#category : #BaselineOfMigrationRulesCollector
}

{ #category : #baselines }
BaselineOfMigrationRulesCollector >> baseline: spec [
	<baseline>
	spec for: #common do: [	
				
		"Packages"
		spec 
			package: 'MigrationRulesCollector';
			package: 'MigrationRulesCollector-Tests' with: [ spec requires: #(MigrationRulesCollector) ];
			package: 'MigrationRulesClassifier' with: [ spec requires: #(MigrationRulesCollector) ] ].
]
