require 'assets/scripts/prefabs/action'

function createEncounter( config )
	return {
		id = config.id,
		title = config.title,
		description = config.description,
		action = config.action,
		encounterType = config.encounterType or 'exploration',
		monsterId = config.monsterId,
		successDescription = config.successDescription,
		successAction = config.successAction,
		loot = config.loot or {},
		failureDescription = config.failureDescription or 'You Died',
		failureAction = config.failureAction or 'Restart',
	}
end
			

local encounters = {
	createEncounter(
		{
			id = 'e01',
			title = 'Barracks',
			description = 'Having concluded the dangerous trip to Mars, the capricious artificial intelligence of the ship informs you of the arrival at Ares Base One.\nYou are tired because of the odyssey you have lived, so you decide to go straight to sleep.\nBut your hopes of having a well-deserved rest disappear when you are suddenly awakened by an alarm. The room is dark, except for the flashing red light.\nYou hear a noise on the other side of the room and you manage to stand up just before something attacks you...',
			action = 'Defend yourself!',
			encounterType = 'combat',
			monsterId = 'monsterImp',
			successDescription = 'What was that? You decide not to waste much more time and go out looking for some type of answers. Before leaving the room, you find a gun and several medkits in a locker.',
			successAction = 'Continue',
			loot = {
				createActionPistol(),
				createActionPistol(),
				createActionPistol(),
				createActionPistol(),
				createActionPistol(),
				createActionMedKit(),
				createActionMedKit(),
				createActionMedKit(),
				createActionMedKit(),
			},
		}
	),
	createEncounter(
		{
			id = 'e02',
			title = 'Living Quarters',
			description = 'Confused by what has just happened, you are looking for someone to talk to. But the place is empty. You walk through the room when someone or something blocks your exit.',
			action = 'Fight!',
			encounterType = 'combat',
			monsterId = 'monsterImp',
			successDescription = 'You try to catch your breath, but other figures begin to stand around you. Without wasting time, you rush out of the room, finding a medkit on the floor next to the door.',
			successAction = 'Continue',
			loot = {
				createActionMedKit(),
				createActionMedKit(),
				createActionMedKit(),
				createActionMedKit(),
				createActionMedKit(),
			},
		}
	),
	createEncounter(
		{
			id = 'e03',
			title = 'Engineering',
			description = 'The engineering room is dark, occasionally illuminated by the sparks that jump from the partially destroyed electronic instruments. In a corner, you see a strange figure crouching over the body of a dead scientist. The creature turns to you as soon as you enter the room...',
			action = 'Fight',
			encounterType = 'combat',
			monsterId = 'monsterImp',
			successDescription = 'You find a laser gun next to the body of the creature. You begin to believe that your problems can only get worse from now on',
			successAction = 'Continue',
			loot = {
				createActionLaserGun(),
				createActionLaserGun(),
				createActionLaserGun(),
			},
		}
	),
	createEncounter(
		{
			id = 'e04',
			title = 'Laboratory',
			description = 'You enter the laboratory ready to shoot whatever is waiting for you, but to your surprise the room is relatively intact.',
			action = 'Look around',
			encounterType = 'exploration',
			successDescription = 'You move through the room and see one of the scientists, crawling across the floor with his right hand covering a deadly wound. "We should not have dug so much" were his last words before dying in your arms.',
			successAction = 'Continue',
		}
	),
	createEncounter(
		{
			id = 'e05',
			title = 'Recreation Room',
			description = 'When entering the recreation area you realize that whatever happened there, it was fast and brutal. The bodies around you indicate that people did not have much time to react. Something moves behind you and you understand that you are about to meet the cause of so much death.',
			action = 'Fight',
			encounterType = 'combat',
			monsterId = 'monsterSuccubus',
			successDescription = 'The fight was intense. You spend some time looking for something of value, but you end up leaving the room empty-handed.',
			successAction = 'Continue',
		}
	),
	createEncounter(
		{
			id = 'e06',
			title = 'Botanics',
			description = 'The air full of oxygen hits you in the face as soon as you enter the garden area. The plants around you are full of life, ignorant of the catastrophe that extends throughout the rest of the base.',
			action = 'Smell the flowers',
			encounterType = 'exploration',
			successDescription = 'For a moment you forget the horrors you have lived up to now. After a short break, you decide to continue your way.',
			successAction = 'Move on',
		}
	),
	createEncounter(
		{
			id = 'e07',
			title = 'Infirmary',
			description = 'Nothing has prepared you for what you see next. The infirmary is a dantesque spectacle. Mutilated bodies scattered everywhere. And that nauseating smell. A pile of bodies located in front of you begins to twist to form a kind of tentacle of flesh and bones...',
			action = 'Fight',
			encounterType = 'combat',
			monsterId = 'monsterFleshNighmare',
			successDescription = 'As you rush to get out of that place, your eye catches a shiny object in a dark corner. You open the metal box and find several medkits inside.',
			successAction = 'Leave the room.',
			loot = {
				createActionMedKit(),
				createActionMedKit(),
				createActionMedKit(),
			},
		}
	),
	createEncounter(
		{
			id = 'e08',
			title = 'Power Plant',
			description = 'The main power generator seems to be working correctly, although the lights in the base are off due to the alarm.',
			action = 'Turn of the alarm',
			encounterType = 'exploration',
			successDescription = 'You play around with some buttons until the alarm is off. The lights turn on around the base.',
			successAction = 'Continue',
		}
	),
	createEncounter(
		{
			id = 'e09',
			title = 'Armory',
			description = 'The armory had already been looted when you arrived, but you spend some time looking for weapons',
			action = 'Look around',
			encounterType = 'exploration',
			successDescription = 'You find a shotgun behind a broken box. This will surely come in handy.',
			successAction = 'Continue',
			loot = {
				createActionShotgun(),
				createActionShotgun(),
				createActionShotgun(),
				createActionShotgun(),
				createActionMedKit(),
				createActionMedKit(),
			},
		}
	),
	createEncounter(
		{
			id = 'e10',
			title = 'Training Room',
			description = 'The training area was a battle ground. The dead bodies of soldiers and demons alike cover the floor.',
			action = 'Look around',
			encounterType = 'exploration',
			successDescription = 'Luckly for you, you find a shotgun still functioning in the hands of a dead soldier. You pay respect to the man and leave the room.',
			successAction = 'Continue',
			loot = {
				createActionShotgun(),
				createActionShotgun(),
				createActionShotgun(),
				createActionShotgun(),
				createActionMedKit(),
				createActionMedKit(),
			},
		}
	),
	createEncounter(
		{
			id = 'e11',
			title = 'Hangar',
			description = 'Your hopes of escaping this nightmare disappear completely. Not only there are no ships available, but also the great gate that communicated the base with the outside world is completely in ruins. You try to think of an alternative plan, but the sound of something crawling towards you brings you back to reality...',
			action = 'Defend yourself!',
			encounterType = 'combat',
			monsterId = 'monsterDemonKnight',
			successDescription = 'You don\'t have time to rest since more creatures are coming from every corner. You ran towars the exit, grabing a couple of items in the way.',
			successAction = 'Leave the room',
			loot = {
				createActionShotgun(),
				createActionLaserGun(),
				createActionMedKit(),
			},
		}
	),
	createEncounter(
		{
			id = 'e12',
			title = 'Warehouse',
			description = 'The warehouse is overrun by demons, but they are busy trying to open one of the containers.',
			action = 'Move slowly',
			encounterType = 'exploration',
			successDescription = 'You manage to move across the room without alerting the demons and avoiding a battle that could have been your last',
			successAction = 'Continue',
		}
	),
	createEncounter(
		{
			id = 'e13',
			title = 'Data Center',
			description = 'Computers everywhere. Some of them still work, although you don\'t have the technical skills to operate them. As you walk away from them, some cables start to move by themselves. You prepare yourself for the battle.',
			action = 'Fight',
			encounterType = 'combat',
			monsterId = 'monsterCyberDemon',
			successDescription = 'You don\'t even try to understand what just happened and instead walk away, grabbing a few items on the way',
			successAction = 'Continue',
			loot = {
				createActionShotgun(),
				createActionLaserGun(),
				createActionMedKit(),
			},
		}
	),
	createEncounter(
		{
			id = 'e14',
			title = 'Comms Center',
			description = 'The communication room is empty and you take the time to try to communicate with someone.',
			action = 'Hello?',
			encounterType = 'exploration',
			successDescription = 'After a few minutes where only static noise is heard, you decide to give up and continue to the inside of the base.',
			successAction = 'Continue',
		}
	),
	createEncounter(
		{
			id = 'e15',
			title = 'Command Center',
			description = 'When you enter the command center someone shoots you from the shadows. If you had taken a second longer to react, you would be dead. You look around and see a wounded soldier leaning against one of the computers.',
			action = 'Talk to the man',
			encounterType = 'exploration',
			successDescription = 'Apparently, excavations under the base have found an old portal to another dimension. When activated by accident, the base was attacked by hundreds of demons.\nThe soldier shoots himself in the head in an act of madness.',
			successAction = 'Leave the room',
			loot = {
				createActionShotgun(),
				createActionLaserGun(),
				createActionMedKit(),
			},
		}
	),
	createEncounter(
		{
			id = 'e16',
			title = 'Recycling',
			description = 'You move slowly through a pile of rubble and debris. Just when you are about to leave the room, a huge hand takes you by the waist and throws you to the other side. You stand up quickly, ready to face the huge creature blocking your way.',
			action = 'Fight',
			encounterType = 'combat',
			monsterId = 'monsterDemonLord',
			successDescription = 'You managed to kill the massive demon, and take some minutes to recover your breath. You find some useful items inside a big barrel.',
			successAction = 'Continue',
			loot = {
				createActionShotgun(),
				createActionLaserGun(),
				createActionMedKit(),
			},
		}
	),
	createEncounter(
		{
			id = 'e17',
			title = 'Excavation Site',
			description = 'Everything around you seems to indicate that you are in the ruins of what was once a sacred place. The marks on the walls and the floor allude to demons and different dimensions. A blinding light shines from the other side of the room. Something huge begins to move towards you from one of the corners...',
			action = 'Fight',
			encounterType = 'combat',
			monsterId = 'monsterDemonLord',
			successDescription = 'With the titanic monster down, you move to the next room.',
			successAction = 'Continue',
		}
	),
	createEncounter(
		{
			id = 'e18',
			title = 'The Void',
			description = 'The light attracts you and you continue to move towards it with the feeling that you no longer have control over your own body. You try to resist the impulse, but your body keeps moving forward. The light becomes stronger and stronger and you feel that it envelops you, making you float.',
			action = 'Let yourself go',
			encounterType = 'endGame',
			successDescription = 'As you traverse the light, you can see the demonic hordes on the other side, awaiting for your arrival.\n\nThe fight has just begun.',
			successAction = 'The End?',
		}
	),
}

function createEncounterManager()
	return {
		type = 'crimild::Group',
		components = {
			{
				type = 'judgementday::components::EncounterManager',
				encounters = encounters,
			},
		}
	}
end

