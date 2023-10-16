//::///////////////////////////////////////////////
//:: Imp Eye Used on Abyssal Portal
//:: 2q6d_quas_eye02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If this is the Abyssal portal then destroy self.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////


int StartingConditional()
{
    object oEye = GetItemPossessedBy(GetPCSpeaker(), "2Q6_ImpGore");
    DestroyObject(oEye, 0.0);
    if(GetTag(OBJECT_SELF) == "2Q6D_AbyssPortal")
    {
        return TRUE;
    }
    return FALSE;
}

