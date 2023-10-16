//::///////////////////////////////////////////////
//:: Witchwork 1: Cinematic Soldier OnSpawn
//:: WW1_Soldier_Sp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Injure the soldier so they give proper
     mouse-over feedback during the cinematic.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2002
//:://////////////////////////////////////////////

void main()
{
    //Toggle off my plot flag
    SetPlotFlag(OBJECT_SELF, FALSE);

    //Determine how much damage needs to be applied.
    int iCurrentHP = GetCurrentHitPoints(OBJECT_SELF);
    int iDamage = Random(iCurrentHP);
    effect eDamage = EffectDamage(iDamage);

    //Injure myself.
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, OBJECT_SELF);

    //Toggle my plot flag back on.
    DelayCommand(1.0, SetPlotFlag(OBJECT_SELF, TRUE));
}
