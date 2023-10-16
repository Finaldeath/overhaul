//::///////////////////////////////////////////////
//:: Name: act_a2amagicped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Inflict one point of damage to the PC
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 13/02
//:://////////////////////////////////////////////

void main()
{
    effect eDamage = EffectDamage(1);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, GetPCSpeaker());
    AssignCommand(GetPCSpeaker(), PlaySound("as_na_branchsnp1"));

}
