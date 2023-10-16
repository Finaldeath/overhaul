//::///////////////////////////////////////////////
//:: Name q1n_exit_beartrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the bear exits this trigger - send it back
    to its lair and set it to neutral...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 4/03
//:://////////////////////////////////////////////

void main()
{
    object oBear = GetExitingObject();
    if (GetTag(oBear) == "q1nbear")
    {
        object oLair = GetWaypointByTag("wp_q1n_bearpost");
        AssignCommand(oBear, ClearAllActions(TRUE));
        SetIsTemporaryNeutral(GetLastHostileActor(), oBear, TRUE, 15.0);
        AssignCommand(oBear, ActionMoveToObject(oLair));
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oBear);
        AssignCommand(oPC, PlaySound("c_bear_bat2"));
    }
}
