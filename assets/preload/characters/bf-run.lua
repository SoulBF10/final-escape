function onCreate()

	makeAnimatedLuaSprite('legs', 'characters/bfrun-legs', getProperty('boyfriend.x'), getProperty('boyfriend.y'))
	addAnimationByPrefix('legs', 'run', 'legs0', 24, true)
	
	setScrollFactor('legs', 1, 1);
	
	
	addLuaSprite('legs', false);	
	
	
	makeAnimatedLuaSprite('legJump', 'characters/bfrun-legsJUMP', 0, 0)
	
	addAnimationByPrefix('legJump', 'jump', 'leg 1 jump', 24, true)
	
	addAnimationByPrefix('legJump', 'fall', 'leg 1 fall', 24, false)
	
	addOffset('legJump', 'fall', 20, -10)
	
	setScrollFactor('legJump', 1, 1);
	
	
	addLuaSprite('legJump', true);
	
	setObjectOrder('legJump',getObjectOrder('banner') + 1)
	
	setObjectOrder('boyfriend',getObjectOrder('legJump') + 1)
	
	playAnim('legJump', 'fall', true, false, 0)
	
	setProperty('legJump.visible',false)


end



function onUpdatePost()

setProperty('legs.x',getProperty('boyfriend.x')+175)

setProperty('legs.y',getProperty('boyfriend.y')+150)

setProperty('legJump.x',getProperty('boyfriend.x')+200)

setProperty('legJump.y',getProperty('boyfriend.y')+160)





end