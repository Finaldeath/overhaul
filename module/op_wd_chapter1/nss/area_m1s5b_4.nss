void main()
{
    if(GetUserDefinedEventNumber() == 700)
    {
        int bFound = FALSE;
        object oPortal = GetFirstObjectInArea(OBJECT_SELF);
        while(GetIsObjectValid(oPortal) && bFound == FALSE)
        {
            if(GetTag(oPortal) == "Portal")
            {
                bFound = TRUE;
                DestroyObject(oPortal);
                CreateObject(OBJECT_TYPE_PLACEABLE,"plc_treeautumn",GetLocation(GetWaypointByTag("WP_M1S5BDestroy")));
            }
            else
            {
                oPortal = GetNextObjectInArea(OBJECT_SELF);
            }
        }
    }
}
