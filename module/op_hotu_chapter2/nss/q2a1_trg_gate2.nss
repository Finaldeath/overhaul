//Make sure the gatekeeper doesn't run all over the place trying
//to start conversation with the PC
//q2a1_trg_gate2
void main()
{
    object oGateKeeper = GetEnteringObject();
    if (GetTag(oGateKeeper) != "q2dgatekeeper")
        return;

    //Make sure the gatekeeper isn't in combat
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") == 1)
        return;

    //Move Gatekeeper back to his post
    AssignCommand(oGateKeeper, ClearAllActions());
    object oPost = GetWaypointByTag("wp_q2dgatekeeper_post");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oGateKeeper);
    AssignCommand(oGateKeeper, ActionDoCommand(ActionMoveToObject(oPost, FALSE)));
    AssignCommand(oGateKeeper, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
}
