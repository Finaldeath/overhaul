//::///////////////////////////////////////////////
//:: Sleeping Man, Female PC (Condition Script)
//:: H3c_SMan_Female.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the PC is female.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGender = GetGender(oPC);

    if (iGender == GENDER_FEMALE)
    {
        return TRUE;
    }
    return FALSE;
}
