// Castle on-enter event

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    effect eLargeWeb = EffectVisualEffect(VFX_DUR_WEB_MASS);
    effect eSmallWeb = EffectVisualEffect(VFX_DUR_WEB);

    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    while(oObject != OBJECT_INVALID)
    {
        if(GetTag(oObject) == "q6f1_LargeWeb")
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLargeWeb, oObject);
        else if(GetTag(oObject) == "q6f1_SmallWeb")
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSmallWeb, oObject);

        oObject = GetNextObjectInArea(OBJECT_SELF);
    }

}
