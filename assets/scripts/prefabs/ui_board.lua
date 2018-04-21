require 'assets/scripts/utils/behaviors'

function createUIEventButton( config )
	return {
		type = 'crimild::Text',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = { 1.0, 1.0, 0.0, 1.0 },
		text = config.title,
		textAnchor = 'center',
		components = {
			{
				type = 'judgementday::components::UIEventButton',
				eventName = config.eventName,
			},
		},
		transformation = {
			translate = config.translate,
		},
	}
end

function createUIBoardPlay()
	return {
		type = 'crimild::Group',
		name = 'play',
		nodes = {
			createUIEventButton( { eventName = 'quit', title = 'QUIT', translate = { -0.5, 0.375, 0.0 } } ),
			createUIEventButton( { eventName = 'move', title = 'MOVE', translate = { 0.0, -0.375, 0.0 } } ),
		},
	}
end

function createUIBoard( config )
	return {
		type = 'crimild::Group',
		nodes = {
			createUIBoardPlay(),
		},
		components = {
			createComponentBehaviorController(
				{
					events = {
						createEventBehavior(
							'playerWillMove',
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = false } ),
									},
								}
							)
						),
						createEventBehavior(
							'playerDidMove',
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = true } ),
									},
								}
							)
						)					
					},
				}
			),
		},
	}
end

