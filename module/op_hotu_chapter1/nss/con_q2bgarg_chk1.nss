//::///////////////////////////////////////////////
//:: Name: con_q2bgarg_chk1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    return TRUE if the last strength check succeeded
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 10/02
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nStrengthSucceed") == 1)
        return TRUE;
    return FALSE;
}
