//::///////////////////////////////////////////////
//:: Githzerai Pilgrim, I am Female (Condition Script)
//:: H2c_Pilg_Female.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC is female.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iGender = GetGender(OBJECT_SELF);

    if (iGender == GENDER_FEMALE)
    {
        return TRUE;
    }
    return FALSE;
}
