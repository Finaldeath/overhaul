// Play gust of wind sound when a PC is near the open
//front door of Drogans House
void main()
{
    object oDoor = GetObjectByTag("q1a_door_int");
    object oWind = GetObjectByTag("q1a1WindGust");
    if (GetIsOpen(oDoor) == TRUE)
    {
        SoundObjectPlay(oWind);
    }
    else
    {
        SoundObjectStop(oWind);
    }
    //Check to see if the music has been changed.
    if (GetLocalInt(OBJECT_SELF, "nMusicChanged") != 1)
    {
        //if the first cutscene is over
        if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 2)
        {
            SetLocalInt(OBJECT_SELF, "nMusicChanged", 1);
            MusicBackgroundStop(OBJECT_SELF);
            MusicBackgroundChangeDay(OBJECT_SELF, TRACK_CITYMARKET);
            MusicBackgroundChangeNight(OBJECT_SELF, TRACK_CITYNIGHT);
            MusicBackgroundPlay(OBJECT_SELF);

        }
    }
}
