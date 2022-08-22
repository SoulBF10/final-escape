
-- This is a Part of the Multiple Character Script 

function onCreate()

		for i = 0, getProperty('unspawnNotes.length')-1 do

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') and getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
				
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Make it so the note got ignored
				
				
				
			end 
		end
		
		
		
		
		for i = 0, getProperty('unspawnNotes.length')-1 do

			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') and getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
				
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Make it so the note got ignored
				
				
				
			end 
		end
		
		for i = 0, getProperty('notes.length')-1 do

			if getPropertyFromGroup('notes', i, 'mustPress') and getPropertyFromGroup('notes', i, 'noteType') == '' then
				
				setPropertyFromGroup('notes', i, 'ignoreNote', true); --Make it so the note got ignored
				
				
				
			end 
		end
		
		
		
		
		for i = 0, getProperty('notes.length')-1 do

			if not getPropertyFromGroup('notes', i, 'mustPress') and getPropertyFromGroup('notes', i, 'noteType') == '' then
				
				setPropertyFromGroup('notes', i, 'ignoreNote', true); --Make it so the note got ignored
				
				
				
			end 
		end
	
end
