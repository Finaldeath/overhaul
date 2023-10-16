//::///////////////////////////////////////////////
//:: Name con_wguard_chk1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    return false if the warning guard has been talked
    to once.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Dec 3/02
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nTalkedTo") == 1)
        return FALSE;
    return TRUE;
}
