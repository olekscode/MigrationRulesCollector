Class {
	#name : #MigrationRulesCollector,
	#superclass : #Object,
	#instVars : [
		'rules'
	],
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
MigrationRulesCollector >> collectRules: aDeprecationSelector fromMethod: aCompiledMethod [
	| ruleCollectingVisitor |
	ruleCollectingVisitor := MigrationRulesCollectingVisitor new.
	ruleCollectingVisitor deprecationSelector: aDeprecationSelector.
	aCompiledMethod ast acceptVisitor: ruleCollectingVisitor.
	
	rules addAll: (ruleCollectingVisitor rules collect: [ :rule |
		rule method: aCompiledMethod ]).
]

{ #category : #initialization }
MigrationRulesCollector >> initialize [ 
	super initialize.
	rules := OrderedCollection new.
]

{ #category : #accessing }
MigrationRulesCollector >> rules [ 
	^ rules
]
