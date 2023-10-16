//::///////////////////////////////////////////////
//:: Beehive OnUsed Script
//:: q1_use_beehive
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When using the beehive
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oAlias = GetObjectByTag("q2_alias");
    object oPC = GetFirstPC();
    int nQuest = GetLocalInt(GetFirstPC(), "OS_HELPDRUID");
    //if you have promised to look into the beehives for the Hermit
    if(nQuest==15 || nQuest==20)
    {
        SetLocked(OBJECT_SELF,FALSE);
    }
    //else the beehive damages you
    else
    {
        int nCurrHP = GetCurrentHitPoints(oPC);
        effect eDam = EffectDamage(nCurrHP/10,DAMAGE_TYPE_PIERCING);
        effect eVis = EffectVisualEffect(VFX_DUR_FLIES);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oPC,6.0);
        DelayCommand(0.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oPC));
    }
}
