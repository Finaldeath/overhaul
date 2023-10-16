//::///////////////////////////////////////////////
//:: Witch Wake 1: Rat Roast, Heal 1d4 hp
//:: WW1_RatRoast.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Heal 1d4 hp for the player
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    effect eHeal = EffectHeal(d4());

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oPC);
}
