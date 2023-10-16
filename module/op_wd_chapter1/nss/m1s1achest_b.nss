void main()
{
    if(GetLocalInt(GetLastUsedBy(),"NW_L_M1S1ATalkedToBriley") == FALSE)
    {
        object oBriley = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_oBriley");
        if(IsInConversation(oBriley) == FALSE)
        {
            vector vPos = GetPosition(GetLastUsedBy());
            AssignCommand(oBriley,SetFacingPoint(vPos));
            AssignCommand(oBriley,SpeakOneLinerConversation());
        }
    }
    else
    {
        SetLocked(OBJECT_SELF,FALSE);
    }
}
