require 'assets/scripts/utils/behaviors'
require 'assets/scripts/prefabs/encounter_card'
require 'assets/scripts/prefabs/ui_combat'

function createUIEventButton( config )
	return {
		type = 'crimild::Text',
		font = 'assets/fonts/Verdana',
		textSize = 0.025,
		textColor = config.color or { 1.0, 1.0, 0.0, 1.0 },
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
			scale = config.scale or 1.0,
		},
	}
end

function createUIBoardPlay()
	return {
		type = 'crimild::Group',
		name = 'play',
		nodes = {
			createUIEventButton( { eventName = 'quit', title = 'QUIT', translate = { -0.5, 0.375, 0.0 } } ),
			createUIEventButton( { eventName = 'move', title = 'MOVE', translate = { 0.0, -0.4, 0.0 }, color = { 1.0, 0.0, 0.0, 1.0 }, scale = 2.0, } ),
		},
	}
end

function createUIEncounter()
	return {
		type = 'crimild::Group',
		name = 'encounter',
		nodes = {
			createEncounterCard( { cardType = 'encounter_begin' } ),
		},
	}
end

function createUIEncounterCompleted()
	return {
		type = 'crimild::Group',
		name = 'encounterCompleted',
		nodes = {
			createEncounterCard( { cardType = 'encounter_succeeded' } ),
		},
	}
end

function createUIEncounterFailed()
	return {
		type = 'crimild::Group',
		name = 'encounterFailed',
		nodes = {
			createEncounterCard( { cardType = 'encounter_failed' } ),
		},
	}
end

function createUIBoard( config )
	return {
		type = 'crimild::Group',
		nodes = {
			createUIBoardPlay(),
			createUIEncounter(),
			createUIEncounterCompleted(),
			createUIEncounterFailed(),
			createUICombat(),
		},
		components = {
			createComponentBehaviorController(
				{
					events = {
						createSceneStartedEventBehavior(
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = true } ),
										createBehaviorEnableNode( { node = 'encounter', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterCompleted', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterFailed', enabled = false } ),
										createBehaviorEnableNode( { node = 'combat', enabled = false } ),
									},
								}
							)
						),
						createEventBehavior(
							'playerWillMove',
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounter', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterCompleted', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterFailed', enabled = false } ),
										createBehaviorEnableNode( { node = 'combat', enabled = false } ),
									},
								}
							)
						),
						createEventBehavior(
							'encounterWillStart',
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounter', enabled = true } ),
										createBehaviorEnableNode( { node = 'encounterCompleted', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterFailed', enabled = false } ),
										createBehaviorEnableNode( { node = 'combat', enabled = false } ),
									},
								}
							)
						),
						createEventBehavior(
							'combatWillStart',
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounter', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterCompleted', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterFailed', enabled = false } ),
										createBehaviorEnableNode( { node = 'combat', enabled = true } ),
									},
								}
							)
						),
						createEventBehavior(
							'combatDidEnd',
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounter', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterCompleted', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterFailed', enabled = false } ),
										createBehaviorEnableNode( { node = 'combat', enabled = false } ),
									},
								}
							)
						),
						createEventBehavior(
							'encounterDidSucceed',
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounter', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterCompleted', enabled = true } ),
										createBehaviorEnableNode( { node = 'encounterFailed', enabled = false } ),
										createBehaviorEnableNode( { node = 'combat', enabled = false } ),
									},
								}
							)
						),
						createEventBehavior(
							'encounterDidFail',
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounter', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterCompleted', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterFailed', enabled = true } ),
										createBehaviorEnableNode( { node = 'combat', enabled = false } ),
									},
								}
							)
						),			
						createEventBehavior(
							'encounterDidEnd',
							createBehaviorSequence(
								{
									behaviors = {
										createBehaviorEnableNode( { node = 'play', enabled = true } ),
										createBehaviorEnableNode( { node = 'encounter', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterCompleted', enabled = false } ),
										createBehaviorEnableNode( { node = 'encounterFailed', enabled = false } ),
										createBehaviorEnableNode( { node = 'combat', enabled = false } ),
									},
								}
							)
						),
					},
				}
			),
		},
	}
end

