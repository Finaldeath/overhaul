void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(OBJECT_SELF,"TOOTH_RECEIVED",1);
    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(oPC,"M1Q3A00TOOTH"),oPC);
    ActionResumeConversation();
}
