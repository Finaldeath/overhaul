//::///////////////////////////////////////////////
//:: Sleeping Man, Lied to About Love, PC is LG (Condition Script)
//:: H3c_SMan_LiePCLG.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is not the Sleeping
     Man's one true love and was LG when named
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
        sAlign == "LG" &&
        sLove !=  "Player")
    {
        return TRUE;
    }
    return FALSE;
}
