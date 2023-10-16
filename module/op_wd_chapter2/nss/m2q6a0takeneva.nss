void main()
{
    object oInfo = GetItemPossessedBy(GetPCSpeaker(),"M2Q06ILETTNEVA");
    DestroyObject(oInfo);
    ActionPauseConversation();
    ActionWait(0.5);
    ActionPlayAnimation(ANIMATION_FIREFORGET_READ);
    ActionWait(1.0);
    ActionResumeConversation();
}
