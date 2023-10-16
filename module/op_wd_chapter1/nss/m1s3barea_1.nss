void main()
{
    string sTag;
    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    object oTestee = GetEnteringObject();
    if(GetIsPC(oTestee))
    {
        while(GetIsObjectValid(oObject))
        {
            sTag = GetTag(oObject);
            if(sTag == "M1S3BWoodPile" &&
               !GetIsObjectValid(GetItemPossessedBy(oObject,"M1S3BurnWand")))
                CreateItemOnObject("M1S3BURNWAND",oObject);
            if(sTag == "M1S3BStones" &&
               !GetIsObjectValid(GetItemPossessedBy(oObject,"M1S3DarkWand")))
                CreateItemOnObject("M1S3DARKWAND",oObject);
            if(sTag == "M1S3BPool" &&
               !GetIsObjectValid(GetItemPossessedBy(oObject,"M1S3GresWand")))
                CreateItemOnObject("M1S3GRESWAND",oObject);
            if(sTag == "M1S3AFog" &&
               !GetIsObjectValid(GetItemPossessedBy(oObject,"M1S3InvisWand")))
                CreateItemOnObject("M1S3INVISWAND",oObject);
            oObject = GetNextObjectInArea(OBJECT_SELF);
        }
        SetLocalObject(OBJECT_SELF,"NW_G_M1S3BTestee",GetEnteringObject());
        if(GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_G_M1S3BMinogon")) == FALSE)
        {
            object oMinogon = CreateObject(OBJECT_TYPE_CREATURE,"M1S3BMINOGON",GetLocation(GetWaypointByTag("WP_M1S3BMinogon")));
            SetLocalObject(OBJECT_SELF,"NW_G_M1S3BMinogon",oMinogon);
        }
    }
}
