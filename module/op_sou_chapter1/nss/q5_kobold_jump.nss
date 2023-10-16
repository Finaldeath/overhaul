//::///////////////////////////////////////////////
//:: Crash kobold out of box when opening it
//:: q5_kobold_jump
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Container detroys itself and creates a kobold to attack the opener
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 13/3/2003
//:://////////////////////////////////////////////

void CreateKobold(object oPC)
{
    object oKobold = CreateObject(OBJECT_TYPE_CREATURE, "q5koboldslasher", GetLocation(OBJECT_SELF));
    AssignCommand(oKobold, ActionAttack(oPC));
}

void main()
{
    object oPC = GetLastOpenedBy();
    effect eDam = EffectDamage(1000);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, OBJECT_SELF);
    DelayCommand(1.0, CreateKobold(oPC));
}
