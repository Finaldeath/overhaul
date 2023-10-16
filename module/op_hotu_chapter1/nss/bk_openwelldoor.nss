//::///////////////////////////////////////////////
//:: bk_openwelldoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This lever is the only way to open the well door
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    //Do nothing before the beholder cutscene
    if (GetLocalInt(GetModule(), "NW_WELLROOMOPEN") == 0)
        return;

    object oWell = GetNearestObjectByTag("welldoor");
    if (GetIsObjectValid(oWell) == TRUE)
    {
        if (GetIsOpen(oWell) == TRUE)
        {
            return;
        }
        else
        // * open it
        {
            ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
            AssignCommand(oWell, ActionOpenDoor(oWell));
            DestroyObject(oWell, 2.0);
        }
    }
}
