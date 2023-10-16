//::///////////////////////////////////////////////
//:: Conversation
//:: m2q2_JaxLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaz and his mother leave.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 23, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "nw_j_rescue"

void main()
{
    object oExit = GetObjectByTag("M2Q2AB_M2Q2A");

    ClearAllActions();
    if (GetIsObjectValid(GetPrisoner()))
    {
        AssignCommand(GetPrisoner(),ClearAllActions());
        AssignCommand(GetPrisoner(),ActionForceMoveToObject(oExit,FALSE,1.9,10.0));
        AssignCommand(GetPrisoner(),ActionOpenDoor(oExit));
        AssignCommand(GetPrisoner(),ActionDoCommand(DestroyObject(OBJECT_SELF)));
        AssignCommand(GetPrisoner(),SetCommandable(FALSE));
    }
    ActionForceMoveToObject(oExit,FALSE,1.9,10.0);
    ActionOpenDoor(oExit);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
