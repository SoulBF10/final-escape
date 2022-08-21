function onCreate()

--Skip intro

makeLuaText('Skip','Press Spacebar to Skip Intro',500,800, 20)
setTextSize('Skip', 20)
setTextAlignment('Skip','center')
setObjectCamera('Skip','other')

addLuaText('Skip')

doTweenAlpha('textSkip','Skip',0,4,'linear')

makeLuaText('instruct','Press TAB to Toggle instructions',500,800, 80)
setTextSize('instruct', 20)
setTextAlignment('instruct','center')
setObjectCamera('instruct','other')

addLuaText('instruct')

doTweenAlpha('instructFade','instruct',0,4,'linear')


makeLuaSprite('instruction', 'final escape/instruction', 0, 0)
setObjectCamera('instruction','other')
addLuaSprite('instruction', true)

setProperty('instruction.alpha',0)





makeLuaSprite('blackBG','final escape/black',-400,-200)

setProperty('blackBG.alpha',1)
scaleObject('blackBG',1.5,1.5)
addLuaSprite('blackBG',false)
setObjectOrder('blackBG',getObjectOrder('strumLineNotes')-1)


makeLuaSprite('circle front','final escape/sonic circle front',100,0)
addLuaSprite('circle front',false)

makeLuaSprite('SONIC','final escape/sonic logo',375,385)
addLuaSprite('SONIC',false)

makeLuaSprite('banner normal','final escape/banner normal',220,370)
addLuaSprite('banner normal',false)



makeAnimatedLuaSprite('exeIntro','final escape/exe breathing',435,75)
addAnimationByPrefix('exeIntro', 'exe', 'exe breating0', 24, true)

addLuaSprite('exeIntro',false)

makeAnimatedLuaSprite('exeScream','final escape/exe reaching out',435,75)
addAnimationByPrefix('exeScream', 'exe', 'exe reaching out', 24, true)

addLuaSprite('exeScream',false)

makeAnimatedLuaSprite('hand','final escape/hand',600,175)
addAnimationByPrefix('hand', 'reaching', 'reaching out hand', 24, true)

addLuaSprite('hand',false)

makeAnimatedLuaSprite('ring flew','final escape/ring flew',80,-175)
addAnimationByPrefix('ring flew', 'flew', 'ring flew', 24, false)

addLuaSprite('ring flew',false)

setProperty('ring flew.visible',false)

makeAnimatedLuaSprite('exeLine','final escape/exe line',380,-50)
addAnimationByPrefix('exeLine', 'line', 'EXE FRONT line', 24, false)

addLuaSprite('exeLine',false)

setProperty('exeLine.visible',false)


--Change Character--
triggerEvent('Change Character', 'dad', 'exefront')
triggerEvent('Change Character', 'BF', 'bf-tiny')

setProperty('dad.x',385)

setProperty('dad.y',-25)

setProperty('bf.x',0)

setProperty('bf.y',0)




setObjectOrder('dad',getObjectOrder('blackBG')+5)



setObjectOrder('circle front',getObjectOrder('dad')-1)

setObjectOrder('ring flew',getObjectOrder('circle front')+1)

setObjectOrder('exeLine',getObjectOrder('ring flew')+1)

setObjectOrder('exeIntro',getObjectOrder('circle front')+1)

setObjectOrder('exeScream',getObjectOrder('circle front')+1)

setObjectOrder('hand',getObjectOrder('exeScream')+1)

setObjectOrder('banner normal',getObjectOrder('exeIntro')+1)

setObjectOrder('SONIC',getObjectOrder('banner normal')+1)


setProperty('exeScream.visible',false)
setProperty('hand.visible',false)

setProperty('dad.visible',false)



setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.visible',false)



setProperty('camHUD.visible',false)





end

Died = false

function onGameOver()

Died = true

end


skipable = false

skipped = false



function onSongStart()

skipable = true

end

instructionShow = false

function onUpdatePost(elapsed)


if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and not skipped and skipable then


	setPropertyFromClass('Conductor', 'songPosition', 13.6 * 1000  ) -- 13.6
	setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
	setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
	
--Remove intro stuff	
	
removeLuaSprite('exeScream',true)
removeLuaSprite('hand',true)
removeLuaSprite('circle front',true)
removeLuaSprite('SONIC',true)	
removeLuaSprite('banner normal',true)	
removeLuaSprite('exeIntro',true)

skipped = true

end



if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') then

    if not instructionShow then
     instructionShow = true
     doTweenAlpha('instructionfadeIn','instruction',1,0.4,'quadIn')
     cancelTween('instructionfadeOut')
    elseif instructionShow then
	 instructionShow = false
     doTweenAlpha('instructionfadeOut','instruction',0,0.4,'quadOut')
     cancelTween('instructionfadeIn')
    end



end











if curStep < 463 and not Died then

 
     cameraSetTarget('dad')
  
	
end	





if curStep == 464 then



    setProperty('HPbar.visible',true )
    setProperty('bfIcon.visible',true )
	
	cameraSetTarget('bf')
	
	setObjectOrder('boyfriend',getObjectOrder('hand attack') + 2)
	setObjectOrder('legJump',getObjectOrder('hand attack') + 1)
	setObjectOrder('legs',getObjectOrder('hand attack') + 1)
	
	doTweenAlpha('fadeBout','blackBG',0,0.4,'linear')
	
	
	removeLuaSprite('SONIC',true)
	
	removeLuaSprite('banner normal',true)
	
	removeLuaSprite('ring flew',true)
	
	removeLuaSprite('exeLine',true)
	
	
triggerEvent('Change Character', 'dad', 'exe')
triggerEvent('Change Character', 'BF', 'bf-run')
	
	
	
end	


if curStep == 87 then


removeLuaSprite('exeIntro',true)
setProperty('exeScream.visible',true)
setProperty('hand.visible',true)

setProperty('camHUD.alpha',0)

doTweenX('handSizeX','hand.scale',1.3,6,'quadOut')
doTweenY('handSizeY','hand.scale',1.3,6,'quadOut')


setProperty('SONIC.y',480)
setProperty('SONIC.angle',35)

doTweenZoom('zoomScary', 'camGame', 1.2, 6, 'linear')







end

if curStep == 91 then

doTweenY('SONIC-fall1','SONIC',385 + 360,1,'backOut')

doTweenX('SONIC-fall2','SONIC',375 + 260,2,'linear')



doTweenY('banner-fall','banner normal',370 + 360,2,'linear')


end




if curStep == 176 then

setProperty('ring flew.visible',true)
setProperty('circle front.visible',false)
playAnim('ring flew', 'flew', true, false, 0)

removeLuaSprite('exeScream',true)
removeLuaSprite('hand',true)
removeLuaSprite('circle front',true)

doTweenZoom('zoomScaryOut', 'camGame', 1, 0.3, 'backOut')

skipable = false


end




if curStep == 192 then

setProperty('dad.visible',true)
setObjectOrder('dad',getObjectOrder('ring flew')+1)

playAnim('dad', 'pulls up', true, false, 0)

setProperty('circle front.visible',false)

setObjectOrder('boyfriend',getObjectOrder('dad')+1)


doTweenZoom('zoomScaryPulls', 'camGame', 1, 0.3, 'quadOut')

setProperty('camHUD.visible',true)

doTweenAlpha('camHUDalpha','camHUD', 1,0.5,'quadOut')


end





if curStep == 448 then


setProperty('exeLine.visible',true)

playAnim('exeLine', 'line', true, false, 0)

setProperty('dad.visible',false)

doTweenZoom('zoomline1', 'camGame', 1.1, 0.2, 'quadOut')

setProperty('defaultCamZoom',1.1)

end


if curStep == 452 then

doTweenZoom('zoomline1', 'camGame', 1.2, 0.2, 'quadOut')

setProperty('defaultCamZoom',1.2)

end

if curStep == 456 then

doTweenZoom('zoomline2', 'camGame', 1.4, 0.2, 'quadOut')
setProperty('defaultCamZoom',1.4)

end

if curStep == 460 then

doTweenZoom('zoomline3', 'camGame', 1.6, 0.1, 'quadOut')
setProperty('defaultCamZoom',1.6)

end

if curStep == 464 then

doTweenZoom('zoomline4', 'camGame', 1, 0.7, 'backOut')
setProperty('defaultCamZoom',1)


doTweenAlpha('bgFadeIn', 'bg',1,2,'quadOut')

setProperty('dad.visible',true)


setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', true)

setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.visible',true)

setProperty('healthBarBG.alpha',0)

doTweenAlpha('HPBGAlpha','healthBarBG',1,0.4,'quadOut')


setProperty('HPbar.angle',-180)
doTweenAngle('HP1','HPbar',0,0.4,'backOut')



setProperty('bg.y',1000)

doTweenY('bgUp', 'bg',-200,2,'quadOut')




end



end
