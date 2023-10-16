//::///////////////////////////////////////////////
//:: Captain Islund Mad
//:: 2Q6A_Islund_Mad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Captain Islund is mad at the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 12, 2002
//:://////////////////////////////////////////////


int StartingConditional()
{
    int nMad = GetLocalInt(OBJECT_SELF, "NW_2Q6_ISLUND_MAD");

    if(nMad == 1)
    {
        return TRUE;
    }
    return FALSE;
}
