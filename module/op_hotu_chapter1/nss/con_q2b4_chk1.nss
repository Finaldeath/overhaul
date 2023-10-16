//::///////////////////////////////////////////////
//:: Name: con_q2b4_chk3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the lever on the throne of bone has been
    found - the search dialog option should not
    appear again.
    This option should also not appear if the same
    player is attempting to search the throne more
    than once a day.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Dec 10/02
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"nQ2B4SearchThrone") != GetCalendarDay())
    {
        if (GetLocalInt(GetModule(), "nQ2B4ThroneFound") == 1)
            return FALSE;
        return TRUE;
    }
    return FALSE;
}
