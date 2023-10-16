//::///////////////////////////////////////////////
//:: Does Player have the cure
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult;

    iResult = HasPlagueCure(GetPCSpeaker())
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q2D_CURE")==0;
    return iResult;
}
