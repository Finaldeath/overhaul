//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Gives Player Tour of Death System
//:: WW1_Hag_Tour.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The Night Hag sends the player and any
     associates to the Plane of Sorrows where she
     can give them a tour of the Death System.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oTour = GetObjectByTag("WP_HagTour");
    effect eVFX = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);

    //Apply smoke puff visuals
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oPC));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oHenchman));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oFamiliar));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oAnimalCompanion));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTour);

    //Play magic forest sound (won't get played on the StartingLocation)
    PlaySound("as_mg_frstmagic4");
    AssignCommand(oTour, PlaySound("as_mg_frstmagic4"));

    //Teleport the player and any associates to the pits of Stygia
    AssignCommand(oPC, ActionJumpToObject(oTour));
    AssignCommand(oHenchman, ActionJumpToObject(oTour));
    AssignCommand(oFamiliar, ActionJumpToObject(oTour));
    AssignCommand(oAnimalCompanion, ActionJumpToObject(oTour));
}
