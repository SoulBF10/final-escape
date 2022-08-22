CurrentRingPop = 0;

RingPopped = 0;



function onCreatePost()








end














function ringPop()

    CurrentRingPop = CurrentRingPop + 1
	
	RingPopped = RingPopped + 1;

    amount = 'ringPop'..RingPopped
	
	
	local RandomPos = getRandomInt((-200), (200), true)
	
	
	if curStep > 464 then
	
	makeAnimatedLuaSprite(amount, 'final escape/ring', getProperty('boyfriend.x')+285,getProperty('boyfriend.y')+100);
	
	end
	
	if curStep < 464 then
	
	makeAnimatedLuaSprite(amount, 'final escape/ring', getProperty('boyfriend.x')+50,getProperty('boyfriend.y')+50);
	
	end
	
	
	addAnimationByPrefix(amount, 'static', 'ring0', 24, true)
	
	setProperty(amount..'.angle',0)
	
	setObjectOrder(amount,getObjectOrder('boyfriend') + 1)
	
	
	
	
	doTweenAlpha('FadePop'..RingPopped, amount, 0, 1, 'linear')
	
	doTweenAngle('P'..RingPopped, amount, getProperty(amount .. '.angle') - 90, 0.7, 'cubeIn')
	
	doTweenY('PopJumpY'..RingPopped, amount, getProperty(amount .. '.y') - 300, 0.4, 'cubeOut')
	doTweenX('PopJumpX'..RingPopped, amount, getProperty(amount .. '.x') + RandomPos , 0.8, 'linear')
	
	
	
	addLuaSprite(amount, true);
		
		
	runTimer('D_'..RingPopped, 0.8, 1);	
	
   


	
end



function onTimerCompleted(tag, loops, loopsLeft)



	if string.sub(tag, 1, 2) == 'D_' then
		 
	
	removeLuaSprite('ringPop' .. string.sub(tag, 3, -1) );
	
	
	CurrentRingPop = CurrentRingPop - 1
	
	if CurrentRingPop == 0 then
	
	RingPopped = 0
	
	end

	end
	
	
	
	if tag == 'RandomRingFall' then
	
	ringPopFall()
	
	end
	
	
	
	
	
	
	if string.sub(tag, 1, 2) == 'F_' then
		 
	
	removeLuaSprite('ringPop' .. string.sub(tag, 3, -1) );
	
	
	CurrentRingPop = CurrentRingPop - 1
	
	if CurrentRingPop == 0 then
	
	RingPopped = 0
	
	end

	end
	
	
	
	


end





function onTweenCompleted(tag)
	-- A tween you called has been completed, value "tag" is it's tag
	
	if string.sub(tag, 1, 8) == 'PopJumpY' then
	
	doTweenY('PopFallY'..string.sub(tag, 9, -1), 'ringPop' .. string.sub(tag, 9, -1) , getProperty('ringPop' .. string.sub(tag, 9, -1).. '.y') + 1000, 0.4, 'cubeIn')
	
	
	end
	
end



function noteMiss(id, direction, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
	
if not isSustainNote then	
ringPop()

end
	
	
end








function ringPopFall()

    CurrentRingPop = CurrentRingPop + 1
	
	RingPopped = RingPopped + 1;

    amount = 'ringPop'..RingPopped
	
	
	local RandomX = getRandomInt((0), (2000), true)
	local RandomOrder = getRandomInt((1), (5), true)
	
	if curStep > 464 then
	
	makeAnimatedLuaSprite(amount, 'final escape/ring', RandomX,-200);
	
	end
	
	
	addAnimationByPrefix(amount, 'static', 'ring0', 24, true)
	
	
	addLuaSprite(amount, false);
	
	
	
	setObjectOrder(amount,getObjectOrder('bg')+RandomOrder)
	
	
	
	
	
	
	doTweenY('PopFallY'..RingPopped, amount, getProperty(amount .. '.y') + 1000, 1, 'linear')
	
	
	
	
		
		
	runTimer('F_'..RingPopped, 1.1, 1);	
	
   


	
end