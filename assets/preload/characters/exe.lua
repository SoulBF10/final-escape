function onCreatePost()
	
	makeAnimatedLuaSprite('circle', 'final escape/circle', getProperty('dad.x'), getProperty('dad.y'))
	addAnimationByPrefix('circle', 'static', 'sonic circle', 24, true)
	setScrollFactor('circle', 0.9, 0.9);
	
	
	addLuaSprite('circle', false);	
	
	makeAnimatedLuaSprite('hand attack', 'final escape/attack arm', getProperty('dad.x'),getProperty('dad.y'))
	addAnimationByPrefix('hand attack', 'grab', 'attack arm grab0', 24, false)
	addAnimationByPrefix('hand attack', 'attack', 'attack arm0', 24, false)
	addAnimationByPrefix('hand attack', 'swallow', 'attack arm swallow0', 24, false)
	addOffset('hand attack', 'swallow', 0, 30)
	addOffset('hand attack', 'attack', -10, -5)
		
	
	

    addLuaSprite('hand attack', true);
	
	playAnim('hand attack', 'attack', true, false, 0)
	
	setProperty('hand attack.alpha', 0.001)
	
	
end


function onUpdatePost()




setProperty('circle.x',getProperty('dad.x') - 275)

setProperty('circle.y',getProperty('dad.y') - 40)

setProperty('circle.angle',getProperty('dad.angle'))



end



