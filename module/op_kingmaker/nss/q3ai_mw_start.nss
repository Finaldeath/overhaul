//::///////////////////////////////////////////////
//:: Magic Weapon Start
//:: q3ai_mw_start
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The magic weapon initial conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_MW_CONVERSATION")==0;
    return iResult;
}
