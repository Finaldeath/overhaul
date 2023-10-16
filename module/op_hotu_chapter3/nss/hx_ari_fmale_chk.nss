//::///////////////////////////////////////////////
//:: hx_ari_fmale_chk
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the PC is male or female.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brad Prince
//:: Created On:  Oct 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetGender(GetFirstPC()) == GENDER_FEMALE)
    {
        return TRUE;
    }
    return FALSE;
}
