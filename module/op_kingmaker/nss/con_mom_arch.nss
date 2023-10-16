//::///////////////////////////////////////////////
//:: con_mom_arch
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if the PC has finished the Archaeologist plot
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    int nGord = GetLocalInt(oPC,"OS_ARCH_KNOW");
    iResult = nGord >=10;
    return iResult;
}
