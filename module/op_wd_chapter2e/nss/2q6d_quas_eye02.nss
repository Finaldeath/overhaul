//::///////////////////////////////////////////////
//:: Quasit Eye Used on Hellist Portal
//:: 2q6d_quas_eye02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If this is the hellish portal then destroy self.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////


int StartingConditional()
{
    object oEye = GetItemPossessedBy(GetPCSpeaker(), "2Q6_QuasitGore");
    DestroyObject(oEye, 0.0);
    if(GetTag(OBJECT_SELF) == "2Q6D_HellPortal")
    {
        return TRUE;
    }
    return FALSE;
}
