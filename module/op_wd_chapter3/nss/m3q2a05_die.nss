//::///////////////////////////////////////////////
//:: Destroy the catapult
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Destroys the catapult and increments the number of catapults dead global AND sets the other global to 1 if all destroyed

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 2001
//:://////////////////////////////////////////////

#include "M3PLOTINCLUDE"

void main()
{
    // CreateObject
    int nNumber = GetLocalInt(GetModule(),"NW_G_M3Q2HOWMANYCATAPULTS");
    nNumber = nNumber + 1;
    SetLocalInt(GetModule(),"NW_G_M3Q2HOWMANYCATAPULTS", nNumber);
    if (nNumber >= 6)
    {
        SetLocalInt(GetModule(),"NW_G_M3Q02TALKFORTILKARDSIEGE",M3Q2_SIEGEENGINESGONE);

    }
    // * Hack.  LOCKED siege weapons are ballista
    if (GetLocked(OBJECT_SELF) == TRUE)
    {
        CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q2_DESTROYED2",GetLocation(OBJECT_SELF));
    }
    else
    {
        CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q2_DESTROYED",GetLocation(OBJECT_SELF));
    }
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
    location lVis = GetLocation(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lVis,1.0);
    DestroyObject(OBJECT_SELF);
}
