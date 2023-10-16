void main()
{
    string sTag = GetTag(GetArea(OBJECT_SELF));
    int nModStage = GetLocalInt(GetModule(), "N_MODULE_STAGE");
    string sDirection = "WP_N_";

    string sModStage = IntToString(nModStage);

    object oWP = GetWaypointByTag(sDirection + sTag + "_" + sModStage);

    while (oWP == OBJECT_INVALID && nModStage >= 0)
    {
        nModStage--;
        sModStage = IntToString(nModStage);

        oWP = GetWaypointByTag(sDirection + sTag + "_" + sModStage);
    }

    location lWP = GetLocation(oWP);

    AssignCommand(GetClickingObject(), JumpToLocation(lWP));
}
