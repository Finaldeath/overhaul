//::///////////////////////////////////////////////
//:: Tentacle Demon (Heartbeat)
//:: HB_TentacleDemon.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Tentacle Demon VFX.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 19, 2003
//:://////////////////////////////////////////////

void main()
{
    effect eWeird = EffectVisualEffect(VFX_FNF_WEIRD);
    int iNth = 1;
    object oNode = GetNearestObjectByTag("WeirdNorth", OBJECT_SELF, iNth);
    float fDelay;

    while(oNode != OBJECT_INVALID)
    {
        fDelay = IntToFloat(Random(7));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eWeird, oNode));

        iNth++;
        oNode = GetNearestObjectByTag("WeirdNorth", OBJECT_SELF, iNth);
    }




//    int bDirection = GetLocalInt(OBJECT_SELF, "bDirection");
//    object oNorthSouth;
//    object oEastWest;

/*    if (bDirection == TRUE)
    {
        oNorthSouth = GetNearestObjectByTag("WeirdNorth");
        oEastWest = GetNearestObjectByTag("WeirdWest");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeird, oNorthSouth);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeird, oEastWest);
        SetLocalInt(OBJECT_SELF, "bDirection", FALSE);
    }
    else
    {
        oNorthSouth = GetNearestObjectByTag("WeirdSouth");
        oEastWest = GetNearestObjectByTag("WeirdEast");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeird, oNorthSouth);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeird, oEastWest);
        SetLocalInt(OBJECT_SELF, "bDirection", TRUE);
    }
*/
}
