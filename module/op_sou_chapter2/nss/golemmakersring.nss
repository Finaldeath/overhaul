//::///////////////////////////////////////////////
//:: Golem-Maker's Ring (OnActivateItem)
//:: GolemMakersRing.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Golem-Maker's Ring.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 1, 2003
//:://////////////////////////////////////////////

void main()
{
    object oItem = GetItemActivated();
    object oTarget = GetItemActivatedTarget();
    string sTargetTag = GetTag(GetItemActivatedTarget());

    if (sTargetTag == "UndrentideGolem" || sTargetTag == "StoneButler")
    {
        int iHitPoints = GetCurrentHitPoints(oTarget);
        int iDamage = iHitPoints - 1;
        effect eDamage = EffectDamage(iDamage, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_FIVE);
        effect eParalyze = EffectCutsceneParalyze();
        effect eVFX = EffectVisualEffect(VFX_FNF_TIME_STOP);
        effect eHeal = EffectHeal(iDamage);

        //Apply effects
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oTarget, 60.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTarget);

        //Set "bDisabled" local.
        SetLocalInt(oTarget, "bDisabled", TRUE);

        //Reactivate in 60 seconds.
        DelayCommand(60.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget));
        DelayCommand(60.0, SetLocalInt(oTarget, "bDisabled", FALSE));
    }
}
