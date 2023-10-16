//::///////////////////////////////////////////////
//:: act_kai_charisma
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Increase Kaidala's charisma by 4.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    effect eChar = EffectAbilityIncrease(ABILITY_CHARISMA,4);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eChar,OBJECT_SELF);
}
