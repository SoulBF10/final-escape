coder1 = 'RealReal'

charter = 'Wilde'

artist1 = 'Aleonepic'
artist2 = 'siivkoi'

music = 'MarStarBro, Purplekav and SrPablo'

Bitch = 1
function onCreate()
    makeLuaSprite('box', 'box', 330, -800)
    addLuaSprite('box', true)
    setObjectCamera('box', 'hud')
    scaleObject('box', 1.5, 1)

    makeLuaText('Credits', 'Credits', 500, getProperty('box.x') + 50, getProperty('box.y'))
    setTextSize('Credits', 50)
    setObjectCamera('Credits', 'hud')
    setTextAlignment('Credits', 'center')
    addLuaText('Credits')

    makeLuaText('Coder', 'Coder', 500, getProperty('Credits.x'), getProperty('Credits.y') + 100)
    setTextSize('Coder', 40)
    setObjectCamera('Coder', 'hud')
    setTextAlignment('Coder', 'center')
    addLuaText('Coder')

    makeLuaText('Coder1', coder1, 500, getProperty('Coder.x'), getProperty('Coder.y') + 50)
    setTextSize('Coder1', 35)
    setObjectCamera('Coder1', 'hud')
    setTextAlignment('Coder1', 'center')
    addLuaText('Coder1')

    makeLuaText('Coder2', coder2, 500, getProperty('Coder.x'), getProperty('Coder.y') + 100)
    setTextSize('Coder2', 35)
    setObjectCamera('Coder2', 'hud')
    setTextAlignment('Coder2', 'center')
    addLuaText('Coder2')

    makeLuaText('Charters', 'Charters', 500, getProperty('Coder.x'), getProperty('Coder2.y') + 70)
    setTextSize('Charters', 50)
    setObjectCamera('Charters', 'hud')
    setTextAlignment('Charters', 'center')
    addLuaText('Charters')

    makeLuaText('Charter1', charter, 500, getProperty('Coder.x'), getProperty('Charters.y') + 50)
    setTextSize('Charter1', 35)
    setObjectCamera('Charter1', 'hud')
    setTextAlignment('Charter1', 'center')
    addLuaText('Charter1')

    makeLuaText('Artists', 'Artists', 500, getProperty('Coder.x'), getProperty('Charter1.y') + 70)
    setTextSize('Artists', 50)
    setObjectCamera('Artists', 'hud')
    setTextAlignment('Artists', 'center')
    addLuaText('Artists')

    makeLuaText('Artist1', artist1, 500, getProperty('Coder.x'), getProperty('Artists.y') + 50)
    setTextSize('Artist1', 35)
    setObjectCamera('Artist1', 'hud')
    setTextAlignment('Artist1', 'center')
    addLuaText('Artist1')

    makeLuaText('Music', 'Music', 500, getProperty('Coder.x'), getProperty('Artist1.y') + 70)
    setTextSize('Music', 50)
    setObjectCamera('Music', 'hud')
    setTextAlignment('Music', 'center')
    addLuaText('Music')

    makeLuaText('Music Man', music, 500, getProperty('Coder.x'), getProperty('Music.y') + 50)
    setTextSize('Music Man', 35)
    setObjectCamera('Music Man', 'hud')
    setTextAlignment('Music Man', 'center')
    addLuaText('Music Man')
end

function onCountdownTick(counter)
    if counter == 4 then
        runTimer('Credits Go', Bitch, 1)
    end
end

function onTimerCompleted(tag, Loops, LoopsLeft)
    if tag == 'Credits Go' then
        doTweenY('box', 'box', 0, 1.1, 'quintOut')
    end
    if tag == 'Credits Dissapear' then
        doTweenY('box Fade', 'box', -800, 1.1, 'quintIn')
        doTweenY('Credits', 'Credits', -800, 1.1, 'quintIn')
        doTweenY('Coder', 'Coder', -800, 1.1, 'quintIn')
        doTweenY('Coder1', 'Coder1', -800, 1.1, 'quintIn')
        doTweenY('Coder2', 'Coder2', -800, 1.1, 'quintIn')
        doTweenY('Charters', 'Charters', -800, 1.1, 'quintIn')
        doTweenY('Charter1', 'Charter1', -800, 1.1, 'quintIn')
        doTweenY('Artists', 'Artists', -800, 1.1, 'quintIn')
        doTweenY('Artist1', 'Artist1', -800, 1.1, 'quintIn')
        doTweenY('Music', 'Music', -800, 1.1, 'quintIn')
        doTweenY('Music Man', 'Music Man', -800, 1.1, 'quintIn')
    end
end

function onTweenCompleted(tag)
    if tag == 'box' then
        doTweenY('Credits', 'Credits', getProperty('box.y'), 0.3, 'quintOut')
        doTweenY('Coder', 'Coder', getProperty('box.y') + 100, 0.35, 'quintOut')
        doTweenY('Coder1', 'Coder1', getProperty('box.y') + 150, 0.35, 'quintOut')
        doTweenY('Coder2', 'Coder2', getProperty('box.y') + 200, 0.35, 'quintOut')
        doTweenY('Charters', 'Charters', getProperty('box.y') + 270, 0.39, 'quintOut')
        doTweenY('Charter1', 'Charter1', getProperty('box.y') + 320, 0.39, 'quintOut')
        doTweenY('Artists', 'Artists', getProperty('box.y') + 390, 0.43, 'quintOut')
        doTweenY('Artist1', 'Artist1', getProperty('box.y') + 440, 0.43, 'quintOut')
        doTweenY('Music', 'Music', getProperty('box.y') + 510, 0.47, 'quintOut')
        doTweenY('Music Man', 'Music Man', getProperty('box.y') + 560, 0.47, 'quintOut')
    end
    if tag == 'Music Man' then
        runTimer('Credits Dissapear', 2.4, 1)
    end
end