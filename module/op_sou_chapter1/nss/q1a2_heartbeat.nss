//::///////////////////////////////////////////////
//:: Name: q1a2_heartbeat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Change music track if attack downstairs has begun.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 31/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X1_Q1A2HENCHTALK") == 1 && GetLocalInt(OBJECT_SELF, "nTrackChanged") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTrackChanged", 1);
        MusicBackgroundChangeNight(OBJECT_SELF, TRACK_BATTLE_DUNGEON2);
        MusicBackgroundChangeDay(OBJECT_SELF, TRACK_BATTLE_DUNGEON2);
        MusicBackgroundPlay(OBJECT_SELF);
    }
    else if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 2 && GetLocalInt(OBJECT_SELF, "nMusicReset") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nMusicReset", 1);
        MusicBackgroundChangeNight(OBJECT_SELF, TRACK_RICHHOUSE);
        MusicBackgroundChangeDay(OBJECT_SELF, TRACK_RICHHOUSE);
        MusicBackgroundPlay(OBJECT_SELF);
    }
}
