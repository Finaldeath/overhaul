void main()
{
    if(GetIsPC(GetExitingObject()) &&
       GetLocalInt(OBJECT_SELF,"NW_L_PortalCreated") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_PortalCreated",TRUE);
        CreateObject(OBJECT_TYPE_PLACEABLE,"nw_recall_portal",GetLocation(GetObjectByTag("WP_Recall")));
    }
}
