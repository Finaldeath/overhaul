void main()
{
    object oNPC = GetEnteringObject();
    object oFearNode = GetNearestObjectByTag("SG_FEARPOINT");

    if ((GetIsPC(oNPC) == FALSE) && (GetIsPC(GetMaster(oNPC)) == FALSE))
    {
        AssignCommand(oNPC, ClearAllActions());
        AssignCommand(oNPC, ActionMoveAwayFromObject(oFearNode, FALSE, 5.0f));
    }
}
