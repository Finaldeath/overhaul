void main()
{
    SetLocalInt(OBJECT_SELF,"KEY_RECEIVED",TRUE);
    object oPC = GetPCSpeaker();
    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(oPC,"M1Q3A00MELDKEY"),oPC);
    ActionResumeConversation();
    SetLocked(GetObjectByTag("M1Q3A_M1Q3G"),FALSE);
    SetLocked(GetObjectByTag("M1Q3CDryadDoor"),FALSE);
}
