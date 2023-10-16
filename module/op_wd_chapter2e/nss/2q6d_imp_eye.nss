//::///////////////////////////////////////////////
//:: Imp Eye Used
//:: 2q6d_imp_eye
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Imp eye used.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////


int StartingConditional()
{
    object oEye = GetItemPossessedBy(GetPCSpeaker(), "2Q6_ImpGore");
    if(GetIsObjectValid(oEye))
    {
        return TRUE;
    }
    return FALSE;
}
