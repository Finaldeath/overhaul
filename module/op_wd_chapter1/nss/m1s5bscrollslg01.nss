void main()
{
   DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1S3Scroll"));
   SetLocalInt(GetModule(),"NW_G_M1S5TreeActive",TRUE);
   CreateObject(OBJECT_TYPE_PLACEABLE,
                "PLC_PORTAL",
                GetLocation(GetWaypointByTag("WP_M1S5BDestroy")));
   DestroyObject(OBJECT_SELF);
}
