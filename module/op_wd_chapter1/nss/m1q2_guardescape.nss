void main()
{
    object oExit = GetNearestObjectByTag("m1q2B_Exit");
    ActionForceMoveToObject(oExit, TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF, 1.0));
    SetCommandable(FALSE);
    if(GetLocalInt(OBJECT_SELF,"NWL_RewardGiven"))
    {
        GiveXPToCreature(GetPCSpeaker(),50);
        SetLocalInt(OBJECT_SELF,"NWL_RewardGiven",TRUE);
    }
}
