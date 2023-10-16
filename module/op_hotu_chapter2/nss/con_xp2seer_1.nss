//::///////////////////////////////////////////////
//:: Name con_xp2seer_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
If Seer has the mirror in her possession. Doesn't
matter what state the Elder brain plot is at.
This option can show up multiple times.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
int StartingConditional()
{
     if (GetGlobalString("sShatteredMirrorGivenTo") == "Seer")
        return TRUE;
    return FALSE;
}
