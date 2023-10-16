// Move dracolich away from exit when player leaves area

void main()
{
    object oPC = GetExitingObject();
    if(!GetIsPC(oPC))
        return;
    object oWP = GetObjectByTag("q3d_wp_appear");
    object oDraco = GetObjectByTag("q3_vixthra");
    if(oDraco == OBJECT_INVALID)
        oDraco = GetNearestObjectByTag("q3d_skeleton", oWP);
    if(oDraco == OBJECT_INVALID)
        return;

    AssignCommand(oDraco, ClearAllActions());
    AssignCommand(oDraco, ActionForceMoveToObject(oWP, TRUE, 1.0, 10.0));
}
