//::///////////////////////////////////////////////
//:: Spell Cast
//:: 2Q6_TOWERLABACT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 16, 2002
//:://////////////////////////////////////////////
#include "2Q6_TOWERLAB"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_G_SetupTowerLab") == 0)
    {
        SetupLab();
        SetLocalInt(OBJECT_SELF,"NW_G_SetupTowerLab",1);
    }
    CreateLabItem(GetLastSpell());
}
