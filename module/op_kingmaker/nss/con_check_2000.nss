//::///////////////////////////////////////////////
//:: con_check_2000
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check for 2000 gold
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetFirstPC();

    if (GetGold(oPC)>1999)
        return TRUE;

    return FALSE;
}