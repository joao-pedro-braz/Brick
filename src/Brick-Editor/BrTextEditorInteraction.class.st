Class {
	#name : #BrTextEditorInteraction,
	#superclass : #Object,
	#instVars : [
		'combination',
		'action',
		'shortcut'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #comparing }
BrTextEditorInteraction >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ combination = anObject combination
		and: [ action = anObject action ]
]

{ #category : #accessing }
BrTextEditorInteraction >> action [
	^ action
]

{ #category : #accessing }
BrTextEditorInteraction >> action: anObject [
	action := anObject
]

{ #category : #converting }
BrTextEditorInteraction >> asShortcut [
	<return: #BlShortcut>

	^ shortcut ifNil: [
		shortcut := BlShortcut new
			combination: self combination;
			action: [ :aShortcut :anEvent | self action value: anEvent currentTarget editor ] ]
]

{ #category : #accessing }
BrTextEditorInteraction >> combination [
	^ combination
]

{ #category : #accessing }
BrTextEditorInteraction >> combination: anObject [
	combination := anObject
]

{ #category : #comparing }
BrTextEditorInteraction >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ combination hash bitXor: action hash
]