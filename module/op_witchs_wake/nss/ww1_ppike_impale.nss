//::///////////////////////////////////////////////
//:: Witch Wake 1: Prince's Pike, Impale
//:: WW1_PPike_Impale.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Kill the player, sending them to the Plane of
     Sorrows (or respawning them to the
     Battlefield if they haven't met the Hag yet)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iHP = GetCurrentHitPoints(oPC);
    effect eImpale = EffectDamage(iHP + 10);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eImpale, oPC);
}
