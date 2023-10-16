void main()
{
    object oExit = GetExitingObject();
    if(GetIsPC(oExit))
    {
        SetLocalObject(OBJECT_SELF,"NW_G_M1S3BTestee",OBJECT_INVALID);
        string sTag;
        object oObject = GetFirstObjectInArea(OBJECT_SELF);
        while(GetIsObjectValid(oObject))
        {
            sTag = GetTag(oObject);
            if(sTag == "M1S3BurnWand" ||
               sTag == "M1S3DarkWand" ||
               sTag == "M1S3GresWand" ||
               sTag == "M1S3InvisWand" ||
               sTag == "M1S3BMinagon")
                DestroyObject(oObject);
            oObject = GetNextObjectInArea(OBJECT_SELF);
        }
        if(GetLocalInt(GetExitingObject(),"NW_L_M1S3Tests") == 20)
            SetLocalInt(GetExitingObject(),"NW_L_M1S3Tests",15);

        DestroyObject(GetItemPossessedBy(oExit,"M1S3BurnWand"));
        DestroyObject(GetItemPossessedBy(oExit,"M1S3DarkWand"));
        DestroyObject(GetItemPossessedBy(oExit,"M1S3GresWand"));
        DestroyObject(GetItemPossessedBy(oExit,"M1S3InvisWand"));
    }
}
