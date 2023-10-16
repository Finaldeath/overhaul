//::///////////////////////////////////////////////
//:: Name hx_ari_male_l2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC is male and romance is less than 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRomance = GetLocalInt(GetModule(), "iAribethRomance");

    if(iRomance < 2)
    {
        if(GetGender(GetPCSpeaker()) == GENDER_MALE)
        {
            return TRUE;
        }
    }
    return FALSE;
}
