void main()
{
    object oBriley = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_oBriley");
    if(IsInConversation(oBriley) == FALSE)
    {
        vector vPos = GetPosition(GetLastAttacker());
        AssignCommand(oBriley,SetFacingPoint(vPos));
        AssignCommand(oBriley,SpeakOneLinerConversation());
    }
}
