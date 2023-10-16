//::///////////////////////////////////////////////
//:: Quasit Eye Used on Hellist Portal
//:: 2q6d_quas_eye
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Has Quasit eye
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oEye = GetItemPossessedBy(GetPCSpeaker(), "2Q6_QuasitGore");
    if(GetIsObjectValid(oEye))
    {
        return TRUE;
    }
    return FALSE;
}
