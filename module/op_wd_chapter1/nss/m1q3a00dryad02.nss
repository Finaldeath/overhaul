void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_ReagentGiven",TRUE);
    ActionPauseConversation();
    //CreateItemOnObject("IT_SMLMISCM1Q3",GetPCSpeaker());
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M1Q3PlotReagent"),GetPCSpeaker());
    ActionResumeConversation();
}
