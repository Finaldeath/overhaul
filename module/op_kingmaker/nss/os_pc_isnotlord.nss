//::///////////////////////////////////////////////
//:: Is PC Lord?
//:: os_pc_isnotlord
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player is not the Lord of the Keep
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oMod = GetModule();
    iResult = GetLocalInt(oMod, "OS_PC_LORD")!=50;
    return iResult;
}
