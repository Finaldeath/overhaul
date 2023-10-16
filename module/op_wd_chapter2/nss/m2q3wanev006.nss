void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_WanevPlot",20);

    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q3IWANEVSUMKEY"),GetPCSpeaker());
    ActionResumeConversation();
}
