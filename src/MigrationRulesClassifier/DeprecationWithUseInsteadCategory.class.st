Class {
	#name : #DeprecationWithUseInsteadCategory,
	#superclass : #DeprecationWithUseCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #accessing }
DeprecationWithUseInsteadCategory >> condition [
	^ [ :deprecation | deprecation explanation asLowercase includesSubstring: 'instead' ]
]

{ #category : #accessing }
DeprecationWithUseInsteadCategory >> name [
	^ 'Includes ''use instead'''
]
