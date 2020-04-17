Class {
	#name : #MigrationRule,
	#superclass : #Object,
	#instVars : [
		'antecedent',
		'consequent',
		'method',
		'explanation',
		'date',
		'version',
		'condition'
	],
	#category : #MigrationRulesCollector
}

{ #category : #comparing }
MigrationRule >> = anotherRule [
	(self species = anotherRule species)
		ifFalse: [ ^ false ].

	((self antecedent = anotherRule antecedent) and: (self consequent = anotherRule consequent))
		ifFalse: [ ^ false ].
		
	(self method = anotherRule method)
		ifFalse: [ ^ false ].
		
	(self date = anotherRule date)
		ifFalse: [ ^ false ].
		
	(self version = anotherRule version)
		ifFalse: [ ^ false ].
		
	(self explanation = anotherRule explanation)
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

{ #category : #accessing }
MigrationRule >> date [
	^ date
]

{ #category : #accessing }
MigrationRule >> date: anObject [
	date := anObject
]

{ #category : #accessing }
MigrationRule >> explanation [
	^ explanation
]

{ #category : #accessing }
MigrationRule >> explanation: anObject [
	explanation := anObject
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

{ #category : #accessing }
MigrationRule >> method [
	^ method
]

{ #category : #accessing }
MigrationRule >> method: anObject [
	method := anObject
]

{ #category : #accessing }
MigrationRule >> version [
	^ version
]

{ #category : #accessing }
MigrationRule >> version: anObject [
	version := anObject
]
