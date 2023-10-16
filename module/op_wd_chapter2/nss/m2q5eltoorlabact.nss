//::///////////////////////////////////////////////
//:: Spell Cast
//:: M2Q5ELTOORLABACT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 16, 2002
//:://////////////////////////////////////////////
#include "M2Q5ELTOORLAB"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_G_SetupEltoorLab") == 0)
    {
        SetupLab();
        SetLocalInt(OBJECT_SELF,"NW_G_SetupEltoorLab",1);
    }
    CreateLabItem(GetLastSpell());
}
