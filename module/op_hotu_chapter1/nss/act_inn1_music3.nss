//::///////////////////////////////////////////////
//:: act_inn1_music3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Plays music track #3
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_plot_func"

void main()
{
    TakeGoldFromCreature(1, GetPCSpeaker());
    MusicBackgroundChangeDay(GetArea(OBJECT_SELF), PLOT_MUSIC_3);
    MusicBackgroundChangeNight(GetArea(OBJECT_SELF), PLOT_MUSIC_3);
    MusicBackgroundPlay(GetArea(OBJECT_SELF));
}

