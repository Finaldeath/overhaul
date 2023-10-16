//::///////////////////////////////////////////////
//:: act_kai_cha2nrom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Increase Kaidala's charisma by 2.
    Romance already ended
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    effect eChar = EffectAbilityIncrease(ABILITY_CHARISMA,2);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eChar,OBJECT_SELF);
}
