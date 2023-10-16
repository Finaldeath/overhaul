//::///////////////////////////////////////////////
//:: Southwest Pull Chain, Temple of the Winds (OnUse)
//:: Us_PullChain_SW.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player across the chasm.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 15, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oWP = GetObjectByTag("Winds_02_SW");

    effect eVFX = EffectVisualEffect(VFX_IMP_FROST_L);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oPC);

    AssignCommand(oPC, DelayCommand(1.0, ActionJumpToObject(oWP)));
    AssignCommand(oHench, DelayCommand(1.0, ActionJumpToObject(oWP)));
    AssignCommand(oFamiliar, DelayCommand(1.0, ActionJumpToObject(oWP)));
    AssignCommand(oCompanion, DelayCommand(1.0, ActionJumpToObject(oWP)));
    AssignCommand(oSummon, DelayCommand(1.0, ActionJumpToObject(oWP)));
    AssignCommand(oDominated, DelayCommand(1.0, ActionJumpToObject(oWP)));
}
