Class {
	#name : #RewriterRule,
	#superclass : #DeprecationRule,
	#instVars : [
		'antecedent',
		'consequent',
		'condition'
	],
	#category : #MigrationRulesCollector
}

{ #category : #comparing }
RewriterRule >> = anotherRule [
	super = anotherRule
		ifFalse: [ ^ false ].
	
	((self antecedent = anotherRule antecedent) and: (self consequent = anotherRule consequent))
		ifFalse: [ ^ false ].
		
	(self condition asString = anotherRule condition asString)
		ifFalse: [ ^ false ].
		
	^ true
]

{ #category : #accessing }
RewriterRule >> antecedent [
	^ antecedent
]

{ #category : #accessing }
RewriterRule >> antecedent: anObject [
	antecedent := anObject
]

{ #category : #accessing }
RewriterRule >> antecedentTree [
	^ RBParser parseRewriteExpression: antecedent
]

{ #category : #accessing }
RewriterRule >> condition [
	^ condition
]

{ #category : #accessing }
RewriterRule >> condition: anObject [
	condition := anObject
]

{ #category : #accessing }
RewriterRule >> consequent [
	^ consequent
]

{ #category : #accessing }
RewriterRule >> consequent: anObject [
	consequent := anObject
]

{ #category : #accessing }
RewriterRule >> consequentTree [
	^ RBParser parseRewriteExpression: consequent
]

{ #category : #testing }
RewriterRule >> isRewriterRule [
	^ true
]

{ #category : #printing }
RewriterRule >> printOn: aStream [
	aStream 
		nextPutAll: self class name;
		nextPutAll: ' (';
		nextPutAll: antecedent;
		nextPutAll: ' => ';
		nextPutAll: consequent;
		nextPut: $).
]
