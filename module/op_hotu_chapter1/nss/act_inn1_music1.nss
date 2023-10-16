//::///////////////////////////////////////////////
//:: act_inn1_music1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Plays music track #1
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_plot_func"

void main()
{
    TakeGoldFromCreature(1, GetPCSpeaker());
    MusicBackgroundChangeDay(GetArea(OBJECT_SELF), PLOT_MUSIC_1);
    MusicBackgroundChangeNight(GetArea(OBJECT_SELF), PLOT_MUSIC_1);
    MusicBackgroundPlay(GetArea(OBJECT_SELF));
}
