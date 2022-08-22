ringleft = 15

ENDING = false

function onCreate()





	-- background stuff
	
floatyStuff = 7

	makeLuaSprite('bg', 'final escape/bg', -114, -200);
	setScrollFactor('bg', 0.9, 0.9);
	scaleObject('bg',1,1.2)
	setObjectOrder('bg',getObjectOrder('bg')-20)
	
	addLuaSprite('bg', false);
	
	makeLuaSprite('lines', 'final escape/lines', -10, -125);
	setScrollFactor('lines', 0.9, 0.9);
	
	addLuaSprite('lines', false);
	
	makeLuaSprite('whiteglow', 'final escape/whiteglow', 140, 375);
	setScrollFactor('whiteglow', 0.9, 0.9);
	
	addLuaSprite('whiteglow', false);
	
	makeAnimatedLuaSprite('banner', 'final escape/banner', 425, 350)
	addAnimationByPrefix('banner', 'roll', 'banner0', 24, true)
	setScrollFactor('banner', 0.9, 0.9);
	setObjectOrder('banner',getObjectOrder('dad'))
	
	addLuaSprite('banner', true);
	
	--Random THings
		
	makeLuaSprite('SEGA', 'final escape/sega', 825, 40);
	scaleObject('SEGA',1.2,1.2)
	setScrollFactor('SEGA', 1, 1);
	
	addLuaSprite('SEGA', false);
	
	makeLuaSprite('eggbox', 'final escape/egg box', 1000, 85);
	
	setProperty('eggbox.angle',-15)
	scaleObject('eggbox',1,1)
	setScrollFactor('eggbox', 1, 1);
	
	addLuaSprite('eggbox', false);
	
	makeLuaSprite('cube', 'final escape/cube', 1035, -60);
	
	scaleObject('cube',1,1)
	setScrollFactor('cube', 1, 1);
	
	addLuaSprite('cube', false);
	
	makeAnimatedLuaSprite('block2', 'final escape/block2', 765, -50)
	addAnimationByPrefix('block2', 'static', 'gh 20', 24, true)
	setScrollFactor('block2', 0.9, 0.9);
	
	
	addLuaSprite('block2', false);	
	
	makeAnimatedLuaSprite('block1', 'final escape/block1', 250, -95)
	addAnimationByPrefix('block1', 'static', 'gh 10', 24, true)
	setScrollFactor('block1', 0.9, 0.9);
	
	
	addLuaSprite('block1', false);	
	
	makeAnimatedLuaSprite('checkpoint', 'final escape/checkpoint', 25, 280)
	addAnimationByPrefix('checkpoint', 'static', 'checkpoint', 24, true)
	setScrollFactor('checkpoint', 0.9, 0.9);
	
	
	addLuaSprite('checkpoint', false);	
	
	
	--SONIC
	
	makeLuaSprite('S', 'final escape/S', 50, 425);
	setScrollFactor('S', 1, 1);
	
	addLuaSprite('S', true);
		
	makeLuaSprite('O', 'final escape/O', 250, 385);
	setScrollFactor('O', 1, 1);
	
	addLuaSprite('O', true);
	
	makeLuaSprite('N', 'final escape/N', 765, 175);
	setScrollFactor('N', 1, 1);
	
	addLuaSprite('N', false);
	
	makeLuaSprite('I', 'final escape/I', 1000, 175);
	setScrollFactor('I', 1, 1);
	
	addLuaSprite('I', false);
	
	makeLuaSprite('C', 'final escape/C', 1075, 200);
	setScrollFactor('C', 1, 1);
	
	addLuaSprite('C', false);
	
	
	
	--Rings
	
	if not downscroll then
	
	makeAnimatedLuaSprite('rings', 'final escape/ring', 1185, 625)
	addAnimationByPrefix('rings', 'static', 'ring0', 24, true)
	setObjectCamera('rings', 'hud')
	addLuaSprite('rings', false);
	
	scaleObject('rings',1.5,1.5)
	
	end
	
	if downscroll then
	
	makeAnimatedLuaSprite('rings', 'final escape/ring', 1185, 10)
	addAnimationByPrefix('rings', 'static', 'ring0', 24, true)
	setObjectCamera('rings', 'hud')
	addLuaSprite('rings', false);
	
	scaleObject('rings',1.5,1.5)
	
	end


    makeLuaText('Ring',ringleft,500,890, getProperty('rings.y') + 20)
    setTextSize('Ring', 45)
    setTextAlignment('Ring','center')
    setTextFont('Ring', 'NiseSegaSonic.ttf')
	setObjectCamera('Ring', 'hud')
	
	addLuaText('Ring')
	
	
	
	
	
end






function onCreatePost()

setTextFont('scoreTxt', 'splash.ttf')
setTextSize('scoreTxt', 40)


setTextFont('timeTxt', 'splash.ttf')
setTextSize('timeTxt', 40)





runTimer('tweenThings', 0.02, 0)

setObjectOrder('boyfriend',getObjectOrder('banner') + 3)

setObjectOrder('legs',getObjectOrder('banner') + 2)
setObjectOrder('legJump',getObjectOrder('banner') + 2)

setProperty('gf.alpha',0)



setProperty('iconP2.visible',false)
setProperty('iconP1.visible',false)

setProperty('cameraSpeed',4)





--EXE ICON


	makeAnimatedLuaSprite('exeIcon', nil, 285, getProperty('healthBar.y') -80)
	loadGraphic('exeIcon', 'icons/'..getProperty('dad.healthIcon'), 150)
	addAnimation('exeIcon', 'icon/'..getProperty('dad.healthIcon'), {0, 1}, 0, true)
	setObjectCamera('exeIcon', 'hud')
	setObjectOrder('exeIcon',getObjectOrder('healthBar') + 3)
	setProperty('exeIcon.alpha',0)
	addLuaSprite('exeIcon')
	
	makeAnimatedLuaSprite('bfIcon', nil, 285, getProperty('healthBar.y') -80)
	loadGraphic('bfIcon', 'icons/'..getProperty('boyfriend.healthIcon'), 150)
	addAnimation('bfIcon', 'icon/'..getProperty('boyfriend.healthIcon'), {0, 1}, 0, true)
	setObjectCamera('bfIcon', 'hud')
	setObjectOrder('bfIcon',getObjectOrder('healthBar') + 2)
	
	setProperty('bfIcon.alpha',1)
	
	setProperty('bfIcon.flipX',false)
	addLuaSprite('bfIcon')
	
	
	
	
--HealthBar

makeLuaSprite('HPbar', '', getProperty('healthBar.x'),getProperty('healthBar.y'));
makeGraphic('HPbar',getProperty('healthBar.width'),getProperty('healthBar.height'),'00B6FF')
addLuaSprite('HPbar', true);
setObjectOrder('HPbar',getObjectOrder('healthBar') + 1)
setObjectCamera('HPbar', 'hud');

setProperty('HPbar.visible',false )
setProperty('bfIcon.visible',false )



luaDebugMode = true;
	--runHaxeCode([[
		--for (strum in game.strumLineNotes)
		--{
			--strum.cameras = [game.camGame];
			--strum.scrollFactor.set(1, 0);
		--}

		--for (note in game.unspawnNotes)
		--{
			--note.cameras = [game.camGame];
			--note.scrollFactor.set(1, 0);
		--}

		--for (splash in game.grpNoteSplashes)
		--{
			--splash.cameras = [game.camGame];
			--splash.scrollFactor.set(1, 0);
		--}
	--]])







end

Died = false

moving = true



function onGameOver()

Died = true

cancelTimer('RandomRingFall')

end



function onUpdatePost()


if ringleft < 0 and not Died then 

setProperty('health',-999)

end











if keyJustPressed('accept') and not getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and not Died then


    if moving == false then
     runTimer('tweenThings', 0.02, 0)
     moving = true
    elseif moving == true then
     cancelTimer('tweenThings')
     moving = false
     
    end

	
	


end



setProperty('HPbar.width', (getProperty('health') / 2) )
setProperty('HPbar.scale.x', (getProperty('health') / 2) )

updateHitbox('HPbar')


setProperty('bfIcon.x', getProperty('HPbar.width') + 285 )

updateHitbox('bfIcon')



if curStep > 464 and not Died then
	
	cameraSetTarget('bf')
	
	

end




if curStep == 464 and not Died then

setProperty('health',2)

runTimer('HpDecay', 0.02, 0)
runTimer('RandomRingFall',0.1,0)

	setProperty('exeIcon.y',(getProperty('healthBar.y')-80) + 50 )
	doTweenAlpha('exeIconA','exeIcon',1,0.4,'quadOut')
    doTweenY('exeIconY','exeIcon',getProperty('healthBar.y') - 80,0.4,'quadOut')
	
	
	setProperty('banner.y',450)
	doTweenY('banner','banner',350,1.2,'quadOut')
	
	setProperty('boyfriend.y',350)
	doTweenY('bfRise','boyfriend',250,1.2,'quadOut')	
	
	
end






if curStep == 1896 and not Died then

ENDING = true

setProperty('dad.stunned',true)

triggerEvent('window_shake', 200, 200)

playSound('exe death',1)

doTweenY('SonicFallingahhh','dad',getProperty('dad.y') + 1300,4,'backIn')

doTweenX('exeFadeOut', 'dad',getProperty('dad.x') - 300,4,'backIn')


doTweenY('fall1', 'block1',getProperty('block1.y') + 1000,3.6,'backIn')

doTweenY('fall2', 'block2',getProperty('block2.y') + 1000,3.4,'backIn')

doTweenY('fall3', 'SEGA',getProperty('SEGA.y') + 1000,2.5,'backIn')

doTweenY('fall4', 'eggbox',getProperty('eggbox.y') + 1000,1,'backIn')

doTweenY('fall5', 'checkpoint',getProperty('checkpoint.y') + 1000,2.3,'backIn')

doTweenY('fall6', 'cube',getProperty('cube.y') + 1000,1.5,'backIn')


doTweenAlpha('bgFadeout', 'bg',0,3.4,'quadOut')


doTweenAlpha('whiteglowfadeout', 'whiteglow',0,1,'quadOut')

doTweenAlpha('lines gone', 'lines',0,1,'quadOut')


--SONIC


doTweenY('S', 'S',getProperty('S.y') + 1000,2.2,'backIn')

doTweenY('O', 'O',getProperty('O.y') + 1000,2.4,'backIn')

doTweenY('N', 'N',getProperty('N.y') + 1000,2.6,'backIn')

doTweenY('I', 'I',getProperty('I.y') + 1000,2.8,'backIn')

doTweenY('C', 'C',getProperty('C.y') + 1000,3,'backIn')



cancelTimer('RandomRingFall')







end

if ENDING then
playAnim('dad', 'singUP', true, false, 0)
end


end

function onBeatHit()
	-- triggered 4 times per section
	
	
	
	
end




function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	
if tag == 'tweenThings' and curBeat > 115 and not Died then
	
	
floatyStuff = floatyStuff + 0.2

if not ENDING then 


doTweenY('floaty1', 'dad', (((math.sin(floatyStuff) / 4)*-3)*3.5)+30,0.001)

--SONIC ALPHABET FLOAT


doTweenY('S', 'S', (( (math.sin(floatyStuff) / 5 )*-3)*10.5 )+425,0.001)

doTweenY('O', 'O', (( (math.sin(floatyStuff) / 6 )*-3)*10.5 )+385,0.001)

doTweenY('N', 'N', (( (math.sin(floatyStuff) / 5 )*-3)*10.5 )+175,0.001)

doTweenY('I', 'I', (( (math.sin(floatyStuff) / 6 )*-3)*10.5 )+175,0.001)

doTweenY('C', 'C', (( (math.sin(floatyStuff) / 5 )*-3)*10.5 )+200,0.001)



--Floating things

doTweenY('block1', 'block1', (( (math.sin(floatyStuff) / 5 )*-3)*10.5 )-95,0.001)

doTweenY('block2', 'block2', (( (math.sin(floatyStuff) / 7 )*-3)*10.5 )-50,0.001)

doTweenY('SEGA', 'SEGA', (( (math.sin(floatyStuff) / 8 )*-3)*10.5 )+40,0.001)

doTweenY('eggbox', 'eggbox', (( (math.sin(floatyStuff) / 9 )*-3)*10.5 )+85,0.001)

doTweenAngle('lines', 'lines', (( (math.sin(floatyStuff) / 10 )*-3)*5.5 )+0,0.001)

doTweenY('checkpoint', 'checkpoint', (( (math.sin(floatyStuff) / 4 )*-3)*10.5 )+280,0.001)

doTweenY('cube', 'cube', (( (math.sin(floatyStuff) / 3 )*-3)*10.5 )-60,0.001)

doTweenX('bfrun', 'boyfriend', (( (math.sin(floatyStuff) / 10 )*-3)*10.5 )+620,0.001)


end
	
	
	
	
	
	
	
end
	
	
	
if tag == 'HpDecay' and moving == true and not Died then

setProperty('health',getProperty('health') - 0.0028)


end
	
	
if tag == 'backtoidleBF' then
	
	
	doTweenColor('return', 'boyfriend', 'FFFFFF', 0.001, 'linear')
	doTweenColor('returnleg', 'legs', 'FFFFFF', 0.001, 'linear')
	doTweenColor('returnlegjump', 'legJump', 'FFFFFF', 0.001, 'linear')
	
	
end



	
	
end




function noteMiss(id, direction, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
	
	

	missAnimation = {"singLEFT","singRIGHT","singUP","singDOWN"}
	
	
	
	if not isSustainNote then
	
	ringleft = ringleft - 1 
	
	setTextString('Ring',ringleft)
	
	end
	
	
	--Miss Animation
	
	doTweenColor('missed', 'boyfriend', '7666EC', 0.001, 'linear')
	doTweenColor('missedleg', 'legs', '7666EC', 0.001, 'linear')
	doTweenColor('missedlegjump', 'legJump', '7666EC', 0.001, 'linear')

    
	playAnim('boyfriend', missAnimation[direction], true, false, 0)
    runTimer('backtoidleBF',0.24,1)

	
	
end
