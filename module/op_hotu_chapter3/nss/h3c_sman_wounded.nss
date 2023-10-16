//::///////////////////////////////////////////////
//:: Sleeping Man, Sensei Dead, PC Wounded (Condition Script)
//:: H3c_SMan_Wounded.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sensei is dead and the
     PC is wounded.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oSensei = GetObjectByTag("H2_Sensei");
    int bDead = GetIsDead(oSensei);
    object oPC = GetPCSpeaker();
    int iCurrentHP = GetCurrentHitPoints(oPC);
    int iMaxHP = GetMaxHitPoints(oPC);

    if (bDead == TRUE &&
        iCurrentHP < iMaxHP)
    {
        //Heal Player before returning TRUE
        effect eHeal = EffectHeal(iMaxHP-iCurrentHP);
        effect eVFX = EffectVisualEffect(VFX_IMP_HEALING_G);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oPC);

        return TRUE;
    }
    return FALSE;
}
