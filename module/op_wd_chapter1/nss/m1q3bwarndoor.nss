void main()
{
    if(GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q3BPermission") == FALSE &&
       GetTag(GetLastOpenedBy()) != "M1Q3ADUMBGUA")
    {
        object oGuard = GetNearestObjectByTag("M1Q3ADUMBGUA");
        SetLocalInt(oGuard,"NW_L_M1Q3BWarn",2);
        AssignCommand(oGuard,ActionStartConversation(oGuard));
    }
}
