
attackpos = {}

warningpos = {}

warningpos2 = {}

warningColor = 1

function onCreate()


    for i = 0, getProperty('eventNotes.length')-1 do
	
        if getPropertyFromGroup('eventNotes', i, 'event') == 'exe attack' then
				
		    table.insert(attackpos, getPropertyFromGroup('eventNotes', i, 'strumTime'))
			
			table.insert(warningpos, getPropertyFromGroup('eventNotes', i, 'strumTime') - (crochet * 2) )
			
			table.insert(warningpos2, getPropertyFromGroup('eventNotes', i, 'strumTime') - crochet )
				
        end
        
    end
 


	
	makeLuaSprite('warning1', 'final escape/warning1', 505, 250)
	setObjectCamera('warning1', 'hud')
	scaleObject('warning1',1.5,1.5)
	addLuaSprite('warning1', true)
	
	makeLuaSprite('warning2', 'final escape/warning2', 505, 250)
	setObjectCamera('warning2', 'hud')
	scaleObject('warning2',1.5,1.5)
	addLuaSprite('warning2', true)
	
	
	setProperty('warning1.alpha',0)
	setProperty('warning2.alpha',0)
	
	
	
	
	
	   
end



function popWarning (warningCount)


if warningCount == 1 then
setProperty('warning1.alpha',1)
doTweenAlpha('warning1Alpha','warning1',0,0.35,'linear')
end

if warningCount == 2 then
setProperty('warning2.alpha',1)
doTweenAlpha('warning2Alpha','warning2',0,0.35,'linear')
end






setProperty('camera.zoom',getProperty('camera.zoom')+ 0.1)

end

Died = false

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
	
	if not Died then
	
	Died = true
	
	end

end


function onUpdatePost()






spos = getSongPosition()




if not Died then

for i=#attackpos,1,-1 do
	if spos >= attackpos[i] then
		attack()
		runTimer('autoJump',0.01,1)
		table.remove(attackpos, i)
	end
end

for i=#warningpos,1,-1 do
	if spos >= warningpos[i] then
		playSound('warning',0.9)
		popWarning(1)
		
		
		table.remove(warningpos, i)
	end
end

for i=#warningpos2,1,-1 do
	if spos >= warningpos2[i] then
		playSound('warning',0.9)
		popWarning(2)
		
		table.remove(warningpos2, i)
	end
end



end




end


function attack()

setProperty('dad.stunned', true)
playAnim('dad', 'attack', true, false, 0)
setProperty('hand attack.alpha', 1)
playAnim('hand attack', 'attack', true, false, 0)

runTimer('DodgeTime',0.15,1)

end
