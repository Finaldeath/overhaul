//::///////////////////////////////////////////////
//:: Witchwork Conversation System: NPC Killed
//:: WW_Abil_Killed.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     As a result of a successful Silence:
     Dexterity check, the player has killed the
     NPC before they could raise an alarm.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    effect eDeath = EffectDeath(TRUE);
    AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_STEAL, 1.0, 0.4));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, OBJECT_SELF, 0.5);
}
