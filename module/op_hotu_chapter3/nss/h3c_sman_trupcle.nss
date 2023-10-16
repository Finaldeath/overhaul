//::///////////////////////////////////////////////
//:: Sleeping Man, LE PC is True Love (Condition Script)
//:: H3c_SMan_TruPCLE.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is the Sleeping
     Man's one true love and was LE when named
     by the Knower of Names.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sAlign = GetLocalString(GetModule(), "sPCAlignmentWhenNamed");
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    object oPC = GetPCSpeaker();
    int iGender = GetGender(oPC);
    if (iGender == GENDER_FEMALE &&
        sAlign == "LE" &&
        sLove ==  "Player")
    {
        return TRUE;
    }
    return FALSE;
}
