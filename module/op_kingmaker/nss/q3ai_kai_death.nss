//::///////////////////////////////////////////////
//:: Kaidala destroyed
//:: q3ai_kai_death
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Soul Harvester leaves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    effect eDisappear = EffectDisappear();
    object oSoul = GetObjectByTag("q1_soulharvester");

    DelayCommand( 4.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDisappear, oSoul));
}
