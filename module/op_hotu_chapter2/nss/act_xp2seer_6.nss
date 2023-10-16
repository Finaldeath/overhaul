//::///////////////////////////////////////////////
//:: Name act_xp2seer_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give the Mirror to the PC.
    Mark the PC as having it.
*/
//:://////////////////////////////////////////////
//:: Created By:Drew Karpyshyn
//:: Created On: Oct. 31, 2003
//:://////////////////////////////////////////////
#include "x2_inc_globals"
void main()
{
    object oPC = GetPCSpeaker();
    CreateItemOnObject("q6_mirror",oPC);
    SetGlobalString("sShatteredMirrorGivenTo", "");
}

