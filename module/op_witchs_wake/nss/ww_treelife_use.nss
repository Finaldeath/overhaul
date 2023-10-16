//::///////////////////////////////////////////////
//:: Witchwork: Tree of Life, OnUse
//:: WW_TreeLife_OnUse.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Teleports the user and all associates to the
     nearest WP_TreeOfLife waypoint.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWP = GetNearestObjectByTag("WP_TreeOfLife");
    object oPC = GetLastUsedBy();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    effect eVFX = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
//  effect eDark = EffectDarkness();

    //Apply smoke puff visuals
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oPC));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oHenchman));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oFamiliar));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oAnimalCompanion));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oSummoned));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oWP));

    //Apply Darkness effect
//    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDark, oPC, 1.0);

    //Play magic forest sound
    PlaySound("as_mg_frstmagic4");
    AssignCommand(oWP, PlaySound("as_mg_frstmagic4"));

    //Jump player & associates to Tree of Life waypoint.
    DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oWP)));
    DelayCommand(1.0, AssignCommand(oHenchman, JumpToObject(oWP)));
    DelayCommand(1.0, AssignCommand(oFamiliar, JumpToObject(oWP)));
    DelayCommand(1.0, AssignCommand(oAnimalCompanion, JumpToObject(oWP)));
    DelayCommand(1.0, AssignCommand(oSummoned, JumpToObject(oWP)));

}
