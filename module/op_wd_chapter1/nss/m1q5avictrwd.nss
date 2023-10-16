void main()
{
    ActionForceMoveToObject(GetNearestObjectByTag("WP_VictFlee"),TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
    if(GetLocalInt(OBJECT_SELF,"NW_L_RewardGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_RewardGiven",TRUE);
        GiveXPToCreature(GetPCSpeaker(),25);
    }
}
