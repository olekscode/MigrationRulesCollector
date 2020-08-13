Class {
	#name : #DeprecationWithUseCategory,
	#superclass : #NonTransformingCategory,
	#category : #PharoDeprecationsClassifier
}

{ #category : #accessing }
DeprecationWithUseCategory >> condition [ 
	^ [ :deprecation | deprecation explanation isString and: [ deprecation explanation asLowercase includesSubstring: 'use' ] ]
]

{ #category : #accessing }
DeprecationWithUseCategory >> name [ 
	^ 'Includes ''use'''
]
