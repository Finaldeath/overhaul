//::///////////////////////////////////////////////
//:: Name: q2e_trig_musicg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Music Trigger for pergatory - on enter change
    to nice music - on exit - change to not-so-nice
    music
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 29/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC))
    {
        MusicBackgroundChangeDay(GetArea(OBJECT_SELF), TRACK_TEMPLEGOOD);
        MusicBackgroundChangeNight(GetArea(OBJECT_SELF), TRACK_TEMPLEGOOD);
        SetWeather(GetArea(OBJECT_SELF), WEATHER_SNOW);
        MusicBackgroundPlay(GetArea(OBJECT_SELF));

    }
}
