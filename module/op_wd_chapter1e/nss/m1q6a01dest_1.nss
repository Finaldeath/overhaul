void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_InConversation") == FALSE &&
        GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualInProgress") == FALSE)
    {
        SetFacingPoint(GetPosition(GetLocalObject(GetArea(OBJECT_SELF),"NW_L_oFenthick")));
        ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
    }

}
