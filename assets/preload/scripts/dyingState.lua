justDied = false

attacked = false


function onCreate()

	makeLuaSprite('fadeoutblack', 'final escape/fadeblack', -2000, -200);
	setScrollFactor('fadeoutblack', 0.9, 0.9);
	
	
	makeLuaSprite('spotlight', 'final escape/spotlight', 35, -100);
	setScrollFactor('spotlight', 0.9, 0.9);
	
	makeLuaSprite('stars', 'final escape/stars', 605, 280);
	setScrollFactor('stars', 0.9, 0.9);
	
	makeLuaSprite('retry', 'final escape/retry', 605, 190); --300
	setScrollFactor('retry', 0.9, 0.9);
	
	
	
	makeAnimatedLuaSprite('exe kill', 'final escape/exe kill', 520, -60); 
	addAnimationByPrefix('exe kill', 'dead', 'exe kill', 24, true)
	setScrollFactor('exe kill', 0.9, 0.9);
    
	makeAnimatedLuaSprite('hands', 'final escape/hands', 70, 100); 
	addAnimationByPrefix('hands', 'idle', 'hands fade', 24, true)
	addAnimationByPrefix('hands', 'kill', 'hands kill', 24, false)
	setScrollFactor('hands', 0.9, 0.9);
	addOffset('hands', 'kill', 0, 150)
	
	

	
	
	
    
   	
   
	
	
	makeAnimatedLuaSprite('bf dead', 'final escape/bf dead', 585, -250); --300
	addAnimationByPrefix('bf dead', 'dead', 'bf dead', 24, true)
	setScrollFactor('bf dead', 0.9, 0.9);
	
    
   	
    addLuaSprite('bf dead', true);
	
	
	
	
	
	

end

dead = false

Dodging = false


function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
	
	
	if curStep < 464 then
	
	
	setProperty('dad.visible',false)
	setProperty('boyfriend.visible',false)
	restartSong(false)

	
	end
	
dead = true	
	
addLuaSprite('fadeoutblack', true);
	
	
	
	
if justDied == false then
	

runTimer('cancelEvents',0.1,1)

setProperty('health',0.01)
	
setProperty('camZooming',true)
setProperty('boyfriend.stunned',true)
setProperty('dad.stunned',true)


addLuaScript('general_scripts/ignore')
	
soundFadeOut('',0.5, 0)
	
setProperty('vocals.volume', 0)
	
doTweenAlpha('rip','camHUD', 0, 0.5, 'linear')

playAnim('dad', 'attack', true, false, 0)


if not attacked then
playAnim('hand attack', 'grab', true, false, 0)
end





setProperty('hand attack.alpha', 1)
	
runTimer('grabbed',0.2,1)	
doTweenZoom('zoomGrab1', 'camGame', 1.3, 0.2, 'quadOut')


playSound('grab',1)

	
runTimer('tooslow',0.5,1)	
	
runTimer('hahaha',3.5,1)


runTimer('TransitionFall',6.2,1)



justDied = true
	
	
end
	
if justDied == true then 

end
	
	
	
	return Function_Stop;
end


winning = false

function onEndSong()
    if winning == false then
	    GameOver = true
        return Function_Stop
		
		
		
		
		
		
    end
	
	
	setProperty('camera.alpha',0)
	
    return Function_Continue
end


DeathScreen = false


-- Tween/Timer hooks
function onTweenCompleted(tag)
	-- A tween you called has been completed, value "tag" is it's tag
	
	if tag == 'bf falling' then
	
	addLuaSprite('exe kill', true);
	addLuaSprite('hands', true);
	addLuaSprite('retry', true);
	addLuaSprite('stars', true);
	
	
	
	setObjectOrder('exe kill',getObjectOrder('spotlight')+1)
	setProperty('exe kill.alpha',0)
	
	setObjectOrder('hands',getObjectOrder('exe kill')+1)
	setProperty('hands.alpha',0)
	setProperty('hands.scale.x',0.8)
	setProperty('hands.scale.y',0.8)
	
	doTweenAlpha('exe comeAlpha', 'exe kill',1,10,'quadIn')
	doTweenX('exe comeX', 'exe kill.scale',1.25,10,'quadIn')
	doTweenY('exe comeY', 'exe kill.scale',1.25,10,'quadIn')
	
	doTweenAlpha('handsAlpha', 'hands',1,10,'quadIn')
	doTweenX('handsXscale', 'hands.scale',1,10,'quadIn')
	doTweenY('handsYscale', 'hands.scale',1,10,'quadIn')
	
	--retry
	
	
	setProperty('retry.alpha',0)
	setObjectOrder('retry',getObjectOrder('bf dead')+1)
	doTweenAlpha('retryAlpha', 'retry',1,1,'quadIn')
	
	setProperty('stars.alpha',0)
	setObjectOrder('stars',getObjectOrder('bf dead')+1)
	doTweenAlpha('starsAlpha', 'stars',1,1,'quadIn')
	
	
	runTimer('timeLeft',15,1)
	
	runTimer('ticking',1,15)
	
	DeathScreen = true
	
	end
	
end


ringleft = 15

CanPressRetry = true

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	
	
	
    if tag == 'DodgeTime' and not Dodging then
     
	 attacked = true
     setProperty('health',-999)
	 
     playAnim('hand attack', 'grab', true, false, 5)
	 
	 setProperty('boyfriend.alpha', 0)	
     setProperty('legs.alpha', 0)	
     setProperty('legJump.alpha', 0)
     
     
     
    end

    if tag == 'DodgeTime' and Dodging then
     
     runTimer('backtoidle',0.24,1)
     
     
    end
	
	if tag == 'backtoidle' then
	setProperty('hand attack.alpha', 0.001)
	setProperty('dad.stunned', false)
	end
	
	
	
	
	
	if tag == "grabbed" then
	
	 cancelTimer('bfJumpDown')
	 cancelTween('bfjumpUp')
	  
	 setProperty('boyfriend.visible', false)	
     setProperty('legs.visible', false)	
     setProperty('legJump.visible', false)	
	 
	 doTweenZoom('zoomGrab2', 'camGame', 1, 0.4, 'backOut')
	  
	 setProperty('boyfriend.y',250)
	 
	  
	end
	
	if tag == "tooslow" then 
	  
     playSound('too-slow',1)
	  
	  
	  
	end
	
	if tag == 'hahaha' then
	
	playSound('hahaha',1)
	
	runTimer('laugh',0.6,5)
	
	playAnim('hand attack', 'swallow', true, false, 0)
	
	
	end
	
	
	if tag == 'laugh' then
	
	
	
	playAnim('dad', 'attack', true, false, 0)
	
	doTweenZoom('zoomLaugh', 'camGame', 1.1, 0.1, 'backOut')
	
	end
	
	
	
	
if tag == 'TransitionFall' then

GameOver = true  

setProperty('hand attack.visible', false)
	
--Things floating	

doTweenY('fall1', 'block1',getProperty('block1.y') + 1000,3.6,'backIn')

doTweenY('fall2', 'block2',getProperty('block2.y') + 1000,3.4,'backIn')

doTweenY('fall3', 'SEGA',getProperty('SEGA.y') + 1000,2.5,'backIn')

doTweenY('fall4', 'eggbox',getProperty('eggbox.y') + 1000,1,'backIn')

doTweenY('fall5', 'checkpoint',getProperty('checkpoint.y') + 1000,2.3,'backIn')

doTweenY('fall6', 'cube',getProperty('cube.y') + 1000,1.5,'backIn')



doTweenAlpha('bgFadeout', 'bg',0,3.4,'quadOut')


doTweenAlpha('whiteglowfadeout', 'whiteglow',0,1,'quadOut')

doTweenAlpha('lines gone', 'lines',0,1,'quadOut')





doTweenY('fallBannerY', 'banner',getProperty('banner.y') + 1000,3.5,'backIn')
	
doTweenX('fallBannerX', 'banner',getProperty('banner.x') + 100,4,'quadIn')

doTweenAngle('rotatebanner', 'banner',getProperty('banner.angle') + 45,4,'quadIn')






--FadeOut



doTweenX('FadeOutReally', 'fadeoutblack',-200,4,'quadIn')

doTweenX('exeFadeOut', 'dad',getProperty('dad.x') - 300,4,'quadIn')


--SONIC


doTweenY('S', 'S',getProperty('S.y') + 1000,2.2,'backIn')

doTweenY('O', 'O',getProperty('O.y') + 1000,2.4,'backIn')

doTweenY('N', 'N',getProperty('N.y') + 1000,2.6,'backIn')

doTweenY('I', 'I',getProperty('I.y') + 1000,2.8,'backIn')

doTweenY('C', 'C',getProperty('C.y') + 1000,3,'backIn')




runTimer('GameOver',4,1)

	
end
	
	

if tag == 'GameOver' then



addLuaSprite('spotlight', true);
setObjectOrder('spotlight',getObjectOrder('fadeoutblack')+1)
setProperty('spotlight.alpha',0)

doTweenAlpha('spotlightPop','spotlight', 1, 0.3, 'linear')


setObjectOrder('bf dead',getObjectOrder('spotlight')+5)
doTweenY('bf falling', 'bf dead',300,3.6,'bounceOut')





end

	
	
if tag == 'timeLeft' then


playAnim('hands', 'kill', true, false, 0)

playSound('woosh',1)

runTimer('Clap',0.95,1)	

CanPressRetry = false

setProperty('retry.alpha',0)
setProperty('stars.alpha',0)

end



if tag == 'ticking' then

playSound('tick',1)

ringleft = ringleft - 1

end


if tag == "Clap" then

playSound('jumpscare',1)

setProperty('camGame.alpha',0)


runTimer('jumpscareEND',4,1)



end

if tag == 'jumpscareEND' then

exitSong(true)

end


	
if tag == 'retry' then


restartSong(false)

end








	
end





function onUpdatePost()

setProperty('hand attack.x',getProperty('dad.x')+40)

setProperty('hand attack.y',getProperty('dad.y')+60)


if GameOver == true then

setPropertyFromClass('Conductor', 'songPosition', -10000 ) -- it is counted by milliseconds, 1000 = 1 second
setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
setProperty('vocals.volume', 0)



cameraSetTarget('bf')


end


if getProperty('boyfriend.y') < 220 then

Dodging = true

elseif getProperty('boyfriend.y') > 220 then

Dodging = false

end







if DeathScreen == true and CanPressRetry then


if keyJustPressed('accept') then

playSound('ring',1)

cancelTimer('timeLeft')
cancelTimer('ticking')

runTimer('retry',3,1)

doTweenY('retryPressed', 'retry',getProperty('retry.y') - 50,0.6,'quadIn')
doTweenAlpha('retryPressedA', 'retry',0,0.6,'quadIn')

CanPressRetry = false

end 


end



if curStep == 1904 and not died then

winning = true

cancelTimer('HpDecay')

end












end