//::///////////////////////////////////////////////
//:: Set Custom Tokens
//:: act_mom_setvotes
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the custom tokens to say how many votes everyone has.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    int nPC = GetLocalInt(oPC,"OS_PC_VOTES");
    object oBecket = GetObjectByTag("q2_sirbecket");
    int nBecket = GetLocalInt(GetModule(), "OS_BECKET_VOTES");
    object oEnivid = GetObjectByTag("q2_enivid");
    int nEnivid = GetLocalInt(GetModule(), "OS_ENIVID_VOTES");

    if(nBecket<0)
    {
        nBecket = 0;
    }

    if (nPC >= 6)
    {
        CreateItemOnObject("dd_eastegg_km001", oPC);
    }

    SetCustomToken(6001, IntToString(nEnivid));
    SetCustomToken(6002, IntToString(nBecket));
    SetCustomToken(6003, IntToString(nPC));

}
