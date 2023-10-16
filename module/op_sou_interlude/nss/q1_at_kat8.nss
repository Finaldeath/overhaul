//Torias walks away to the edge of the camp
//Katriana turns back to the PC

void main()
{

    object oTorias = GetNearestObjectByTag("Q1_TORIAS");
    object oWP = GetWaypointByTag("Q1_WP_TORIAS_LOOKOUT");
    AssignCommand(oTorias, ActionMoveToObject(oWP));
    AssignCommand(OBJECT_SELF, SetFacingPoint(GetPosition(GetPCSpeaker())));
}
