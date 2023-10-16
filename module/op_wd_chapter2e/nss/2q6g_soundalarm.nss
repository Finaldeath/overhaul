//::///////////////////////////////////////////////
//:: Sound Alarm
//:: 2Q6G_SoundAlarm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sounds the level alarm and alerts Valindra
    to the PCs presence.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetEnteringObject();
    object oSound = GetObjectByTag("2Q6G_AlarmBell");
    if(GetIsPC(oTarget))
    {
        SetLocalInt(GetArea(OBJECT_SELF), "2Q6G_ALARM_TRIPPED", 1);
        SoundObjectPlay(oSound);
    }
}
