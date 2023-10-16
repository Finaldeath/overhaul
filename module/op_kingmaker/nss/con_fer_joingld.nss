//::///////////////////////////////////////////////
//:: con_fer_joingld
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    the PC has at least 1 level Fighter and is eligible to join the militia
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;
    object oGlassy = GetObjectByTag("q2_glassy");
    object oPC = GetFirstPC();
    iResult = (GetLevelByClass(CLASS_TYPE_FIGHTER, oPC) > 0
        || GetLevelByClass(CLASS_TYPE_MONK, oPC) > 0
        || GetLevelByClass(CLASS_TYPE_PALADIN, oPC) > 0)
        && GetLocalInt(oGlassy,"OS_JOIN_MILITIA")<10;
    return iResult;
}
