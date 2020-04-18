Class {
	#name : #MigrationRulesCategory,
	#superclass : #Object,
	#instVars : [
		'rules',
		'subcategories'
	],
	#category : #MigrationRulesClassifier
}

{ #category : #'as yet unclassified' }
MigrationRulesCategory class >> fits: aRule [
	^ true
]

{ #category : #visiting }
MigrationRulesCategory >> accept: aCollectionOfRules [
	aCollectionOfRules do: [ :rule |
		self addIfFits: rule ].
	
	subcategories do: [ :category |
		category accept: rules ].
	
	rules := rules reject: [ :rule |
		subcategories anySatisfy: [ :category |
			category allRules includes: rule ] ].
]

{ #category : #'as yet unclassified' }
MigrationRulesCategory >> addIfFits: aRule [
	(self class fits: aRule)
		ifTrue: [ rules add: aRule ].
]

{ #category : #accessing }
MigrationRulesCategory >> allRules [
	subcategories ifEmpty: [ ^ rules ].
	
	^ rules, (subcategories flatCollect: [ :category |
		category allRules ])
]

{ #category : #initialization }
MigrationRulesCategory >> initialize [ 
	super initialize.
	rules := OrderedCollection new.
	
	subcategories := self class subclasses collect: [ :subclass |
		subclass new ].
]

{ #category : #printing }
MigrationRulesCategory >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: rules size asString;
		nextPut: $).
]

{ #category : #accessing }
MigrationRulesCategory >> rules [ 
	^ rules
]

{ #category : #accessing }
MigrationRulesCategory >> subcategories [
	^ subcategories
]

{ #category : #accessing }
MigrationRulesCategory >> withAllSubcategories [
	^ { self }, (subcategories flatCollect: [ :category |
		category withAllSubcategories ])
]

{ #category : #accessing }
MigrationRulesCategory >> withNonEmptySubcategories [
	^ self withAllSubcategories select: [ :category |
		category rules isNotEmpty ]
]
