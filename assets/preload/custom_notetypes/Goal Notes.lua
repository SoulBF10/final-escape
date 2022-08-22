function onCreate()

	for i = 0, getProperty('unspawnNotes.length')-1 do
	
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Goal Notes' then
		
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'final escape/goal notes') --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0') --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0') --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false)

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true) --Miss has no penalties
			end
			--bomb shit
			
			
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Goal Notes' then
		--bruh
		addLuaScript('general_scripts/ignore')
		setProperty('boyfriend.stunned',true)
		setProperty('dad.stunned',true)
		
		setProperty('vocals.volume', 0)
		
		soundGone = true
		
		playSound('Warp',1)
		runTimer('BOOM',0.6,1)
		
		
		runTimer('restartGoal',2.85,1)
		
		
		doTweenAngle('angleTweenCam','camera',360,1,'linear')
		
	    setPropertyFromClass('Conductor', 'songPosition', -100000 ) -- it is counted by milliseconds, 1000 = 1 second
     
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		
		
	end
end

function onUpdatePost(elapsed)

if soundGone then
setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
end


end



function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	
	if tag == 'BOOM' then
	
	triggerEvent('window_shake', 200, 200)
	
    
	setProperty('camera.alpha',0)
	setProperty('camHUD.alpha',0)
	setProperty('camOther.alpha',0)
	
	
	
	
	end
	
	
	if tag == 'restartGoal' then
	
	restartSong(true)
	
	
	end
	
	
	
	
	
end	