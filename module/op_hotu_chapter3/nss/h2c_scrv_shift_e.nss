//::///////////////////////////////////////////////
//:: Scrivener, Medium Evil Alignment Shift (Condition Script)
//:: H2c_Scrv_Shift_E.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE only if PC hasn't received this
     alignment hit yet.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bDoOnce = GetLocalInt(oPC, "bScrivEvilHit");
    if (bDoOnce == FALSE)
    {
        //Flag the DoOnce
        SetLocalInt(oPC, "bScrivEvilHit", TRUE);
        //Perform the alignment hit
        AdjustAlignment(oPC, ALIGNMENT_EVIL, 3);
        //Do some slashing damage
        effect eDam = EffectDamage(20, DAMAGE_TYPE_SLASHING, DAMAGE_POWER_PLUS_FIVE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_REG_RED), oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPC);
        ExecuteScript("h2a_scrv_navcave", OBJECT_SELF);
        return TRUE;
    }
    return FALSE;
}
