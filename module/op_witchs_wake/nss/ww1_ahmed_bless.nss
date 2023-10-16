//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed's Cairn, Blessing
//:: WW1_Ahmed_Bless.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player blesses the cairn.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 15, 2002
//:://////////////////////////////////////////////

void Bless(object oPC)
{
    //Construct something similar to a Bless effect.
    effect eAttackBonus = EffectAttackIncrease(1);
    effect eDamageBonus = EffectDamageIncrease(1, DAMAGE_TYPE_DIVINE);
    effect eVFX = EffectVisualEffect(VFX_IMP_HOLY_AID);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAttackBonus, oPC, 600.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDamageBonus, oPC, 600.0);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oPC);
}

void main()
{
    //Animate the player.
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 5.0));

    //Give the player a beneficial effect for 10 minutes.
    int iDoOnce = GetLocalInt(oPC, "CONV_AHMED_Bless");

    if (iDoOnce == FALSE)
    {
        DelayCommand(5.0, AssignCommand(oPC, Bless(oPC)));
        SetLocalInt(oPC, "CONV_AHMED_Bless", TRUE);
    }
}
