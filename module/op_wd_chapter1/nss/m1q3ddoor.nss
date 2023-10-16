void main()
{
    CreateObject(OBJECT_TYPE_PLACEABLE,
                 "PLC_PORTAL",
                 GetLocation(GetNearestObjectByTag("WP_M1Q3DPortal")));
}
