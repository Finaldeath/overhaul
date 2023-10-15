void main()
{
    if(IsInConversation(OBJECT_SELF) == FALSE &&
       GetIsDead(OBJECT_SELF) == FALSE)
    {
        location lLoc = GetLocation(GetNearestObjectByTag("WP_Skeleton"));
        ActionCastFakeSpellAtLocation(SPELL_ANIMATE_DEAD,lLoc);
        CreateObject(OBJECT_TYPE_CREATURE,"M1Q0BSUM_SK",lLoc);
    }
    DelayCommand(30.0,SignalEvent(OBJECT_SELF,EventUserDefined(0)));
}
