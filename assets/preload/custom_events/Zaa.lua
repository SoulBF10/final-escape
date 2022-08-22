--Script by RealReal 


duration = 0

fadeoutduration = 0

function onCreate()
precacheImage('ZAAAA/broke') --ตอนโผล่คร้งเเรกจะได้ไม่กระตุกk
end



function onEvent(name, value1, value2)
	if name == "Zaa" then
       makeAnimatedLuaSprite('broke', 'ZAAAA/broke', 0, 0)
       addAnimationByPrefix('broke', 'broke', 'broke', 24, true)
	   
	   setObjectCamera('broke', 'other') 
	   addLuaSprite('broke', true)
	   
	   fadeoutduration = value2
	   duration = value1
	   
	   runTimer('finished', duration, 1)
	
    end
	
	
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'finished' then
      doTweenAlpha('fadeout', 'broke', 0, fadeoutduration, 'linear');
	  
    end

end
