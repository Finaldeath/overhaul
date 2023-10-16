//::///////////////////////////////////////////////
//:: PC Can Bribe
//:: con_raf_bribable
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has enough gold to bribe Rafael, and has Lavos' vote
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    int nGold = GetGold(oPC);
    object oLavos = GetObjectByTag("q2_lavos");
    iResult = nGold>=1700
        && GetLocalInt(GetModule(),"OS_LAVOS_VOTE")==10;
    return iResult;
}
