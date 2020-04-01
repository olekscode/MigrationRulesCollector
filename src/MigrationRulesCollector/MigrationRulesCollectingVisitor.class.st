Class {
	#name : #MigrationRulesCollectingVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'rules'
	],
	#category : #MigrationRulesCollector
}

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
	
	(aMessageNode selector = #deprecated:transformWith:)
		ifFalse: [ ^ self ].

	ruleNode := aMessageNode arguments second.
		 
	rules add: (MigrationRule new
		antecedent: ruleNode receiver value;
		consequent: ruleNode arguments first value).
]
