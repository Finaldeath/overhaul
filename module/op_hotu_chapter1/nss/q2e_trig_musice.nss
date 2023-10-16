//::///////////////////////////////////////////////
//:: Name: q2e_trig_musice
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Music Trigger for pergatory - on enter change
    to good music - on exit - change to not-so-nice
    music
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 29/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC))
    {
        MusicBackgroundChangeDay(GetArea(OBJECT_SELF), TRACK_TEMPLEEVIL);
        MusicBackgroundChangeNight(GetArea(OBJECT_SELF), TRACK_TEMPLEEVIL);
        SetWeather(GetArea(OBJECT_SELF), WEATHER_CLEAR);
    MusicBackgroundPlay(GetArea(OBJECT_SELF));
    }
}
