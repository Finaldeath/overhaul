//::///////////////////////////////////////////////
//:: Name con_q2achk_lead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if this is a leader unit
    from a formation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nLeader") == 1)
        return TRUE;
    return FALSE;
}
