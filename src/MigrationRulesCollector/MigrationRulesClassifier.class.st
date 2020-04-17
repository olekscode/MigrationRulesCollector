Class {
	#name : #MigrationRulesClassifier,
	#superclass : #Object,
	#instVars : [
		'categories',
		'unclassifiedRules'
	],
	#category : #MigrationRulesCollector
}

{ #category : #accessing }
MigrationRulesClassifier >> categories [ 
	^ categories 
]

{ #category : #classification }
MigrationRulesClassifier >> classify: aCollectionOfRules [
	aCollectionOfRules do: [ :rule |
		categories do: [ :category |
			category addIfFits: rule ] ].
	
	unclassifiedRules := aCollectionOfRules select: [ :rule |
		categories noneSatisfy: [ :category |
			category rules includes: rule ] ].
]

{ #category : #initialization }
MigrationRulesClassifier >> initialize [ 
	super initialize.
	self initializeCategories.
]

{ #category : #initialization }
MigrationRulesClassifier >> initializeCategories [
	categories := { 
		MigrationRulesInvalidCategory new .
		MigrationRulesRenamingCategory new }.
]

{ #category : #accessing }
MigrationRulesClassifier >> unclassifiedRules [
	^ unclassifiedRules 
]
