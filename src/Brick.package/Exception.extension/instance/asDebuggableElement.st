*Brick
asDebuggableElement
	| container textElement text debugButton |
	self freeze.
	text := self printString asRopedText.
	text foreground: Color red.
	textElement := BlTextElement new text: text.
	textElement constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].
	container := BlElement new.
	container constraintsDo: [ :c | 
		c vertical matchParent.
		c horizontal matchParent ].
	container layout: BlLinearLayout vertical.
	container addChild: textElement.
	debugButton := BrButton new.
	debugButton look: BrMaterialToggleLabelledLook.
	debugButton label: 'Debug'.
	debugButton action: [ [self defaultAction] fork ].
	container addChild: debugButton.
	^ container