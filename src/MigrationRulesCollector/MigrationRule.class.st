Class {
	#name : #MigrationRule,
	#superclass : #DeprecationRule,
	#instVars : [
		'antecedent',
		'consequent',
		'condition'
	],
	#category : #MigrationRulesCollector
}

{ #category : #comparing }
MigrationRule >> = anotherRule [
	super = anotherRule
		ifFalse: [ ^ false ].
	
	((self antecedent = anotherRule antecedent) and: (self consequent = anotherRule consequent))
		ifFalse: [ ^ false ].
		
	(self condition asString = anotherRule condition asString)
		ifFalse: [ ^ false ].
		
	^ true
]

{ #category : #accessing }
MigrationRule >> antecedent [
	^ antecedent
]

{ #category : #accessing }
MigrationRule >> antecedent: anObject [
	antecedent := anObject
]

{ #category : #accessing }
MigrationRule >> antecedentTree [
	^ RBParser parseRewriteExpression: antecedent
]

{ #category : #accessing }
MigrationRule >> condition [
	^ condition
]

{ #category : #accessing }
MigrationRule >> condition: anObject [
	condition := anObject
]

{ #category : #accessing }
MigrationRule >> consequent [
	^ consequent
]

{ #category : #accessing }
MigrationRule >> consequent: anObject [
	consequent := anObject
]

{ #category : #accessing }
MigrationRule >> consequentTree [
	^ RBParser parseRewriteExpression: consequent
]

{ #category : #testing }
MigrationRule >> isAntecedentAMessageSend [
	(self antecedentTree isMessage)
		ifFalse: [ ^ false ].
		
	"Receiver and all arguments must be Rewriter variables"
	((self antecedentTree receiver class = RBPatternVariableNode) and: [ 
		self antecedentTree arguments allSatisfy: [ :argument |
			argument class = RBPatternVariableNode ] ])
		ifFalse: [ ^ false ].
		
	^ true
]

{ #category : #testing }
MigrationRule >> isMethodRenaming [
	"Both must be message nodes"
	(self antecedentTree isMessage and: [ self consequentTree isMessage])
		ifFalse: [ ^ false ].
		
	"They must have the same receiver"
	(self antecedentTree receiver = self consequentTree receiver)
		ifFalse: [ ^ false ].
		
	"They must have same list of arguments (and in the same order)"
	(self antecedentTree arguments = self consequentTree arguments)
		ifFalse: [ ^ false ].
		
	"Receiver and all arguments must be Rewriter variables"
	((self antecedentTree receiver class = RBPatternVariableNode) and: [ 
		self antecedentTree arguments allSatisfy: [ :argument |
			argument class = RBPatternVariableNode ] ])
		ifFalse: [ ^ false ].
		
	^ true
]

{ #category : #testing }
MigrationRule >> isMigrationRule [
	^ true
]

{ #category : #testing }
MigrationRule >> isValid [
	self antecedentTree isMessage 
		ifFalse: [ ^ false ].
		
	self antecedentTree selector = method selector
		ifFalse: [ ^ false ].
		
	self antecedentTree receiver class = RBPatternVariableNode
		ifFalse: [ ^ false ].
		
	(self antecedentTree arguments allSatisfy: [ :each |
		each class = RBPatternVariableNode ])
		ifFalse: [ ^ false ].
		
	self consequent isEmpty
		ifTrue: [ ^ false ].
		
	self antecedentTree = self consequentTree
		ifTrue: [ ^ false ].
		
	^ true
]
