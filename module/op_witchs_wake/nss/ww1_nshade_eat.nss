//::///////////////////////////////////////////////
//:: Witch Wake 1: Deadly Nightshade, Ingest
//:: WW1_NShade_Eat.nss
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
    effect eNightshade = EffectDeath();

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eNightshade, oPC);
}
