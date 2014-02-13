--Nyxanthaldemus, Tribune Militum of the Underworld
--Project 1 for CCTP645 Poetics of Mobile
--Sara Levine
--My Sources, without which I could not have summoned Nyxanthaldemus:
--Freesound.org
--CoronaDocs
--http://coronalabs.com/resources/tutorials/events-and-listeners/
--Tuts+ Magic 8 Ball tutorial: http://code.tutsplus.com/tutorials/corona-sdk-eight-ball--mobile-3020
-- That's So Panda's using shake event tutorial: http://thatssopanda.com/corona-sdk-tutorials/using-the-shake-event-with-corona-sdk/

--Get rid of display at the top of the screen
display.setStatusBar(display.HiddenStatusBar)
--The background image of Nyxanthaldemus' eyes
local background = display.newImage("bad-advice-bg.png", 160, 250)
--Nyxanthaldemus' jamz
local backgroundMusic = audio.loadStream("yewbic__ambience03.wav")
--Play the music, loop it infinitely, set it to a channel (I think Corona SDK has 30 or more channels for different sounds), and fade it in over five seconds
local backgroundMusicChannel = audio.play(backgroundMusic, {channel=1, loops=-1,fadein=5000})
--Setting up the shake variable
local shake = {}
--What does the Nyxanthaldemus say?
local options = {"I couldn't hear you. Come closer.", "Sounds...delicious.", "I could easily solve all of your problems...if you release me from your phone.", "Allow me to possess your body for 24 hours and I will clear it up.", "Alright I lied! I was a centurion, not a tribune. And I defected 246,000 years ago.", "Wait 10,000 years. Your question will be irrelevant.", "2.8 million years in service to the Underworld and now I'm being shaken for advice by a fleshbag of mucus.", "Yes, yes. Tell me everything. I am the only one you can trust.", "Yes, look deeply into my eyes. You are not feeling sleepy or numb at all..."}
--This is what the opening title screen says when the app is first opened:
local textfield = display.newText("You have summoned Nyxanthaldemus, Tribunus Militum of the Underworld. Shake your phone and I will answer your question.",170,350,200,200,nil,18)
textfield:setTextColor(255,255,255)
--Setting up variables to make the eyes pulsate and glow
local function1, function2
local trans
--Puts an image (a transparent png) over the background, but it loops between transitioning on and transitioning off from visible to invisible and back again one second at a time
local glow = display.newImage("bad-advice-glow.png", 160, 250)
function function1(e)
	trans=transition.to(glow,{time=1000,alpha=1,onComplete=function2})
end
function function2(e)
	trans=transition.to(glow,{time=1000,alpha=0,onComplete=function1})
end
--When the phone is shaken (the event) then one of the phrases fades in on screen
--Also Nyxanthaldemus grunts or something (because you're shaking him - what is wrong with you?)
local function onShake (event)
if event.isShake then
	textfield.text = options[math.random(1,9)]
	transition.from(textfield, {alpha = 0})
	local snarl = audio.loadStream("snarl.wav")
	local snarlChannel = audio.play(snarl, {channel=2, loops=0})
end
end
--Start looping those glowing eyes...
transition.to(glow,{time=1000,alpha=0,onComplete=function1})
--Listener is "listening" for the phone to shake using the phone's accelerometer
Runtime:addEventListener("accelerometer", onShake)