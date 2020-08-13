Class {
	#name : #DeprecationWithUseInsteadCategory,
	#superclass : #DeprecationWithUseCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
DeprecationWithUseInsteadCategory >> condition [
	^ [ :deprecation | deprecation explanation asLowercase includesSubstring: 'instead' ]
]

{ #category : #accessing }
DeprecationWithUseInsteadCategory >> name [
	^ 'Includes ''use instead'''
]
