//::///////////////////////////////////////////////
//:: Name con_q2b4_chk2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PCs search check of the throne of bone
    is successful - this should return true
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 10/02
//:://////////////////////////////////////////////


int StartingConditional()
{
    if (GetLocalInt(GetModule(), "nQ2B4ThroneFound") != 1)
        return FALSE;
    return TRUE;
}
