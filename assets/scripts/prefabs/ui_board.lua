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

function createUIBoard( config )
	return {
		type = 'crimild::Group',
		nodes = {
			createUIEventButton( { eventName = 'quitGame', title = 'QUIT', translate = { -0.5, 0.375, 0.0 } } ),
			createUIEventButton( { eventName = 'rollMovement', title = 'MOVE', translate = { 0.0, -0.375, 0.0 } } ),
		},
	}
end

