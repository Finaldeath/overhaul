//::///////////////////////////////////////////////
//:: Githzerai Pilgrim, I am Male (Condition Script)
//:: H2c_Pilg_Male.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC is male.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iGender = GetGender(OBJECT_SELF);

    if (iGender == GENDER_MALE)
    {
        return TRUE;
    }
    return FALSE;
}
