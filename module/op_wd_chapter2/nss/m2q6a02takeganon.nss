void main()
{
    object oInfo = GetItemPossessedBy(GetPCSpeaker(),"M2Q5CULTJRNL");
    ActionPauseConversation();
    DestroyObject(oInfo);
    ActionWait(0.5);
    ActionPlayAnimation(ANIMATION_FIREFORGET_READ);
    ActionWait(1.0);
    ActionResumeConversation();
}
