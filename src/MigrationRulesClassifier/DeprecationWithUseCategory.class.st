Class {
	#name : #DeprecationWithUseCategory,
	#superclass : #DeprecationCategory,
	#category : #MigrationRulesClassifier
}

{ #category : #accessing }
DeprecationWithUseCategory >> condition [ 
	^ [ :deprecation | deprecation explanation asLowercase includesSubstring: 'use' ]
]

{ #category : #accessing }
DeprecationWithUseCategory >> name [ 
	^ 'Includes ''use'''
]
