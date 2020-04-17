Class {
	#name : #MigrationRulesCollector,
	#superclass : #Object,
	#instVars : [
		'rules'
	],
	#category : #MigrationRulesCollector
}

{ #category : #'as yet unclassified' }
MigrationRulesCollector >> collectRulesFromImage [
	| selectors senders |
	
	selectors := { 
		#deprecated:on:in:transformWith: .
		#deprecated:on:in:transformWith:when: .
		#deprecated:transformWith: .
		#deprecated:transformWith:when: }.
		
	senders := selectors inject: Set new into: [ :union :selector |
		union union: selector senders ].
	
	senders do: [ :sender |
		self collectRulesFromMethod: sender ].
]

{ #category : #'as yet unclassified' }
MigrationRulesCollector >> collectRulesFromImageExcludingPackages: aCollectionOfPackages [
	self collectRulesFromImage.
	
	rules := rules reject: [ :rule |
		aCollectionOfPackages anySatisfy: [ :package |
			package methods includes: rule method ] ].
]

{ #category : #'as yet unclassified' }
MigrationRulesCollector >> collectRulesFromMethod: aMethod [
	| ruleCollectingVisitor |
	ruleCollectingVisitor := MigrationRulesCollectingVisitor new.
	aMethod ast acceptVisitor: ruleCollectingVisitor.
	
	rules addAll: (ruleCollectingVisitor rules collect: [ :rule |
		rule method: aMethod compiledMethod ]).
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
