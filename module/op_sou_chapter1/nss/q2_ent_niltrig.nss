//::///////////////////////////////////////////////
//:: Name  q2_ent_niltrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Nilmaldor cannot leave the room - close door
    and send him back to his post.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:   April 15/03
//:://////////////////////////////////////////////

void main()
{

    object oNil = GetEnteringObject();
    if (GetTag(oNil) == "Q2_NILMALDOR")
    {
        object oDest = GetWaypointByTag("Q2_WP_NILMALDOR_RANDOM3");
        AssignCommand(oNil, ClearAllActions(TRUE));
        AssignCommand(oNil, ActionMoveToObject(oDest, TRUE));

        object oDoor = GetObjectByTag("q2_nil_door");
        if (GetIsOpen(oDoor) == TRUE)
            AssignCommand(oDoor, ActionCloseDoor(oDoor));
    }
}
