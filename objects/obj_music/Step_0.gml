var _finalVol = global.musicVolume*global.masterVolume

if songAsset != targetSongAsset{
	//play song
if audio_exists( targetSongAsset)
{
	songInstance = audio_play_sound(targetSongAsset,4,true);

	//start song
	audio_sound_gain( songInstance, 0,0);
	fadeInInstVol = 0;
}
	//set songasset to match the targetsongasset
		songAsset = targetSongAsset;
}

//volume contol
if audio_is_playing(songInstance)
{
	//Fade the song in 
	if startFadeInTime > 0
	{
		if fadeInInstVol < 1 {fadeInInstVol += 1/startFadeInTime;} else fadeInInstVol = 1;
	}
	else
	{
		fadeInInstVol = 1;
	}
		//set the gain
	audio_sound_gain(songInstance, fadeInInstVol*_finalVol, 0);
}