//::///////////////////////////////////////////////
//:: Name q1sorcereritem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Activate Script for the starting sorcerer item.
    Gives +1 to spellcraft skill 1/day for two minutes
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    // Get the activator
    object oPC = GetItemActivator();

    // Get the item
    object oItem = GetItemActivated();

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_SPELLCRAFT, 1), oPC, 120.0);
}
