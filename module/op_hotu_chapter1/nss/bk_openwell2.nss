//::///////////////////////////////////////////////
//:: bk_openwelldoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Lower well door.
    This lever is the only way to open the well door
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oWell = GetNearestObjectByTag("welldoor2");
    if (GetIsObjectValid(oWell) == TRUE)
    {
        if (GetIsOpen(oWell) == TRUE)
        {
            ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
            AssignCommand(oWell, ActionCloseDoor(oWell));
        }
        else
        // * open it
        {
            ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
            AssignCommand(oWell, ActionOpenDoor(oWell));
        }
    }
}
