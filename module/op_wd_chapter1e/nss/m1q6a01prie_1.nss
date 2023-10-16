void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_InConversation") == FALSE &&
        GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualInProgress") == FALSE)
    {
        int nCount = GetLocalInt(OBJECT_SELF,"NW_L_HBCount");
        if(nCount == 0)
        {
            SetFacingPoint(GetPosition(GetNearestObjectByTag("M1Q6A01Pool")));
            ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,60.0);
            nCount++;
        }
        else if(nCount < 10 && nCount > 0)
        {
            nCount++;
        }
        else
        {
            nCount = 0;
        }
        SetLocalInt(OBJECT_SELF,"NW_L_HBCount",nCount);
    }
    else
    {
        SetLocalInt(OBJECT_SELF,"NW_L_HBCount",0);
    }

}
