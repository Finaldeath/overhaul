//::///////////////////////////////////////////////
//:: act_mom_hench
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Paralyzes the PC's henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oCal = GetNearestObjectByTag("os_hen_cal");
    object oKai = GetNearestObjectByTag("os_hen_kai");
    object oTrp = GetNearestObjectByTag("os_hen_trp");
    object oJab = GetNearestObjectByTag("os_hen_jab");
    effect eVis = EffectVisualEffect(VFX_DUR_PARALYZED);
    effect ePara = EffectParalyze();
    if(GetIsObjectValid(oCal))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,oCal);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,ePara,oCal);
    }
    if(GetIsObjectValid(oKai))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,oKai);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,ePara,oKai);
    }
    if(GetIsObjectValid(oTrp))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,oTrp);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,ePara,oTrp);
    }
    if(GetIsObjectValid(oJab))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis,oJab);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,ePara,oJab);
    }
}
