//::///////////////////////////////////////////////
//:: Name con_q2apretam_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    check to see if the PC speaker is a higher
    level cleric class
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 10/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC) > 10)
        return TRUE;
    return FALSE;
}
