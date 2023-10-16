//::///////////////////////////////////////////////
//:: Name q2bs_ent_rittrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a PC enters the room - have the vampire
    fairy commence her summoning of skeleton
    bombs and sicking them on the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 20/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oFairy = GetObjectByTag("q2bs_fairy2");
        SetLocalInt(oFairy, "nUnderAttack", 1);
        object oTarget = GetWaypointByTag("wp_q2bs_vampfairy_post");
        AssignCommand(oFairy, ActionMoveToObject(oTarget, TRUE));

    }
}
