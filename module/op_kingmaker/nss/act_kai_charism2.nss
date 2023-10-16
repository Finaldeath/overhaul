//::///////////////////////////////////////////////
//:: act_kai_charism2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Increase Kaidala's charisma by 2.
    Romance ends
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    effect eChar = EffectAbilityIncrease(ABILITY_CHARISMA,2);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eChar,OBJECT_SELF);
    SetLocalInt(oPC,"OS_KAI_ROMANCE",99);
}
