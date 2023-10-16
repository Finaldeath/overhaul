void main()
{
    object oInfo = GetItemPossessedBy(GetPCSpeaker(),"M2Q3G_CULTJOURN");
    SetLocalObject(OBJECT_SELF,"NW_L_TakeJournal",oInfo);
    ActionPauseConversation();
    ActionWait(0.5);
    ActionPlayAnimation(ANIMATION_FIREFORGET_READ);
    ActionWait(1.0);
    ActionResumeConversation();
}
