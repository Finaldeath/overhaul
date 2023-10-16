//::///////////////////////////////////////////////
//:: act_exp_explode
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The barrel explodes; the stones loosen and fall
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    SetPlotFlag(OBJECT_SELF,FALSE);
    location lLoc = GetLocation(OBJECT_SELF);
    effect eBoom = EffectVisualEffect(VFX_FNF_FIREBALL,FALSE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eBoom, lLoc);
    effect eDeath = EffectDeath();
    effect eStones = EffectVisualEffect(354);
    object oWay = GetNearestObjectByTag("q3ag_way_loose1");
    location lStones = GetLocation(oWay);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eStones,lStones,1.0);
    CreateObject(OBJECT_TYPE_PLACEABLE,"q3ag_plc_fallen",lStones);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,OBJECT_SELF);
//    DelayCommand(0.5,DestroyObject(OBJECT_SELF));
}
