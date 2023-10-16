//::///////////////////////////////////////////////
//:: Sensei Dharvana, PC Is Not Sleeping Man's True Love (Condition Script)
//:: H2c_Sens_NotPC.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the the PC is not the
     Sleeping Man's one true love (and PC is female).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGender = GetGender(oPC);
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (iGender == GENDER_FEMALE &&
        sLove != "Player")
    {
        return TRUE;
    }
    return FALSE;
}
