//::///////////////////////////////////////////////
//:: Name con_q1dcook_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
when selected by the PC who completed the plot
but only the first time... on this first line set a global on herself
that prevents her from saying it again
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"Lodar_Job")> 0 && GetLocalInt(GetModule(), "Captive_Cook") == 3 && GetLocalInt(OBJECT_SELF, "nGaveThanks") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nGaveThanks", 1);
        return TRUE;
    }
    return FALSE;
}
