//::///////////////////////////////////////////////
//:: os_con_has10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check for 10 gold
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetFirstPC();
    if (GetGold(oPC)>9)
        return TRUE;
    return FALSE;
}
