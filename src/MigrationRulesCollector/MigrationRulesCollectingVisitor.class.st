Class {
	#name : #MigrationRulesCollectingVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'rules',
		'deprecationSelector'
	],
	#category : #MigrationRulesCollector
}

{ #category : #accessing }
MigrationRulesCollectingVisitor >> deprecationSelector: aString [
	deprecationSelector := aString
]

{ #category : #initialization }
MigrationRulesCollectingVisitor >> initialize [
	super initialize.
	rules := OrderedCollection new.
]

{ #category : #initialization }
MigrationRulesCollectingVisitor >> rules [
	^ rules
]

{ #category : #initialization }
MigrationRulesCollectingVisitor >> visitMessageNode: aMessageNode [
	| ruleNode |
	
	(aMessageNode selector = deprecationSelector)
		ifFalse: [ ^ self ].

	ruleNode := aMessageNode arguments second.
		 
	rules add: (MigrationRule new
		antecedent: ruleNode receiver value;
		consequent: ruleNode arguments first value).
]
