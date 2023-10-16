//::///////////////////////////////////////////////
//:: q3ag_loosestone1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The stones loosen and fall
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: July 29, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AG_LOOSE1",1);
    effect eStones = EffectVisualEffect(354);
    object oWay = GetNearestObjectByTag("q3ag_way_loose1");
    location lStones = GetLocation(oWay);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eStones,lStones,1.0);
    CreateObject(OBJECT_TYPE_PLACEABLE,"q3ag_plc_fallen",lStones);
}
