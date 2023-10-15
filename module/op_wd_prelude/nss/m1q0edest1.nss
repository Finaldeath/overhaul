void main()
{
    object oFenthick = GetNearestObjectByTag("M1Q0EFenthick");
    if(IsInConversation(OBJECT_SELF) == FALSE &&
       IsInConversation(oFenthick) == FALSE &&
       GetIsInCombat() == FALSE &&
       GetIsInCombat(oFenthick) == FALSE &&
       GetLocalInt(GetModule(),"NW_G_M0Q01PLOTDESTHER_GONE") < 1)
    {
        ActionStartConversation(OBJECT_SELF);
    }
}
