Class {
	#name : #MigrationRulesCollectorTest,
	#superclass : #TestCase,
	#category : #'MigrationRulesCollector-Tests'
}

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> mockMethod [
	self deprecated: 'This method is deprecated for some reason' transformWith: '`@receiver basicDescription: `@arg' -> '`@receiver description: `@arg'.
]

{ #category : #'as yet unclassified' }
MigrationRulesCollectorTest >> testCollectRulesFromMethod [
	| collector expected |
	
	collector := MigrationRulesCollector new.
	collector collectRulesFromMethod: self class >> #mockMethod.
	
	expected := OrderedCollection withAll: { 
		MigrationRule new
			antecedent: '`@receiver basicDescription: `@arg';
			consequent: '`@receiver description: `@arg';
			method: self class >> #mockMethod;
			yourself }.
	
	self assert: collector rules equals: expected.
]
