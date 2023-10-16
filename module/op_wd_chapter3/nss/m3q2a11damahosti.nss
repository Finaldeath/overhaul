//::///////////////////////////////////////////////
//:: Damas Hostile
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All guards in Fort Ilkard go hostile
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    object oWay1 = GetObjectByTag("WP_M3Q2A11_SOLD1");
    object oWay2 = GetObjectByTag("WP_M3Q2A11_SOLD2");
    location lWay1 = GetLocation(oWay1);
    location lWay2 = GetLocation(oWay2);
    CreateObject(OBJECT_TYPE_CREATURE,"M3Q2_GENSOLDF2",lWay1);
    CreateObject(OBJECT_TYPE_CREATURE,"M3Q2_GENSOLDM2",lWay2);
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
    ActionAttack(GetPCSpeaker());
}
