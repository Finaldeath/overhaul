// act_q2aseer_2
// make sure guards have moved back to their positions.
void main()
{

    object oPC = GetPCSpeaker();

    object oTarget1 = GetWaypointByTag("cut102wp_guard1_2");
    object oTarget2 = GetWaypointByTag("cut102wp_guard2_2");
    object oTarget3 = GetWaypointByTag("cut102wp_guard3_2");
    object oTarget4 = GetWaypointByTag("cut102wp_guard4_2");

    object oGuard1 = GetObjectByTag("cut102_guard1");
    object oGuard2 = GetObjectByTag("cut102_guard2");
    object oGuard3 = GetObjectByTag("cut102_guard3");
    object oGuard4 = GetObjectByTag("cut102_guard4");

    AssignCommand(oGuard1, ActionMoveToObject(oTarget1));
    AssignCommand(oGuard2, ActionMoveToObject(oTarget2));
    AssignCommand(oGuard3, ActionMoveToObject(oTarget3));
    AssignCommand(oGuard4, ActionMoveToObject(oTarget4));

    AssignCommand(oGuard1, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
    AssignCommand(oGuard2, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
    AssignCommand(oGuard3, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
    AssignCommand(oGuard4, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));

}
