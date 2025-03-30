--Хочу передать привет Вемеру
--хочу передать пока тому кто делал старый код ты пидарас блять у меня глаза вылезли наружу от кода прошлого века пиздец боже дай мне сил пожалуйста


luaDebugMode = true
--ВЕМЕР ПРИВЕТ
function onCreate()

    setProperty("skipCountdown", true)

        --Фу,худ
        hud = {"timeBar", "timeBarBG", "timeTxt", "scoreTxt", "iconP1", "iconP2", "healthBar", "healthBarBG"}
        
        for i = 1,8 do
            setProperty(hud[i]..'.visible', false) 
        end

-- Минус персы
    setProperty("dad.alpha", 0)
    setProperty("gf.alpha", 0)
    setProperty("boyfriend.color", "000000")
    setProperty("boyfriend.alpha", 0)

    --skill issue
--[[
    --В пизду этот ваш даунскролл,я заебался эту хуйню писать
        setPropertyFromClass('backend.ClientPrefs', 'data.downScroll', false)
    ]]

    --[[ НЕ ТРОГАТЬ, это чтобы сто раз в настройки не заходить

    setPropertyFromClass('backend.ClientPrefs', 'data.downScroll', false)
    setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
    ]]
end

function onCreatePost()

    --старый код прошлый век я сделал новый оптимизированный и поддерживающий мидл и даун скроллы
    
    if not middlescroll then
        for i = 0,3 do
            setProperty("playerStrums.members["..i.."].x", _G["defaultOpponentStrumX"..i])
            setProperty("opponentStrums.members["..i.."].x", _G["defaultPlayerStrumX"..i])
        end
    end

    for i = 0,7 do
        if not downscroll then
            setProperty("strumLineNotes.members["..i.."].y", -120)
        else
            setProperty("strumLineNotes.members["..i.."].y", 800)
        end
    end

    --крутая штука этот скролл фактор оставьте она ахуенна смотрица мне нрав
    setScrollFactor("gf", 0.9, 1)

end

function onSongStart()
    setProperty("camZoomingMult", 0)
end

function onStepHit()
--О,камера
    if curStep == 10 then
        setProperty('camGame.visible', true)
    end

--О, чёрный бумер
    if curStep == 64 then
        doTweenAlpha('boyfriendA', 'boyfriend' , 1, 3, 'cubeOut')
    end

--Верни стрелки | ща верну не ссыкуй
    if curStep == 112 then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            noteTweenY("note"..i, i, defaultOpponentStrumY0, 2, "cubeOut")
        end
    end
    
    if curStep == 128 then
        doTweenColor('boyfriendBadApple','boyfriend','FFFFFF',0.1,'linear')
        setProperty("dad.alpha", 1)
        setProperty("gf.alpha", 1)

        --для эффектности появления типа йооооу
        triggerEvent("Screen Shake", nil, "0.2, 0.005")
        triggerEvent("Add Camera Zoom", "0.05", "0.04")
        if not hideHud then
            for i = 1,8 do
                setProperty(hud[i]..'.visible', true)
            end
        end
    end
end

--Первое апреля такое типо: | а ты смешной! Расстреляю тебя последним.
function noteMiss()
    playSound('missHonk', 0.7,'CustomMiss')
end



--если кто-то тронет этот код я приду в ваш дом и насру вам на ваше ебало. Я предупредил.

--с 1 апреля. На самом деле не насру а по стенке размажу как говно.