//::///////////////////////////////////////////////
//:: Witch's Wake 1: Morrius, PC Created Cairn for Ahmed
//:: WW1_Morr_Cairn.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player built a cairn for
     Prince Ahmed.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 27, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bCairn = GetLocalInt(oPC, "CONV_AHMED_BuiltCairn");
    if (bCairn == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
