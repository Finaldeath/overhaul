//::///////////////////////////////////////////////
//:: act_inn1_music2
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
    MusicBackgroundChangeDay(GetArea(OBJECT_SELF), PLOT_MUSIC_2);
    MusicBackgroundChangeNight(GetArea(OBJECT_SELF), PLOT_MUSIC_2);
    MusicBackgroundPlay(GetArea(OBJECT_SELF));
}
