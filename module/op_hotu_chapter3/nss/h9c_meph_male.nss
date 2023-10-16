//::///////////////////////////////////////////////
//:: Mephistopheles, Male PC (Condition Script)
//:: H9c_Meph_Male.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the PC is male.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGender = GetGender(oPC);

    if (iGender == GENDER_MALE)
    {
        return TRUE;
    }
    return FALSE;
}
