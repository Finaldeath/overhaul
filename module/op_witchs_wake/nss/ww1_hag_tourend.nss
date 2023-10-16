//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Tour Ends
//:: WW1_Hag_TourEnd.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The Night Hag returns the player and any
     associates to the Ethereal Leak in her home.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oTourEnd = GetObjectByTag("WP_HagTourEnd");
    effect eVFX = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);

    //Set the player's iDeaths local to 0, thereby enabling the default
    //Witchwork death system. It was previously set to -1.
    SetLocalInt(oPC, "iDeaths", 0);

    //Flag them as having completed the Tour of the Plane of Sorrow.
    SetLocalInt(oPC, "CONV_NIGHT_HAG_TourComplete", TRUE);

    //Apply smoke puff visuals
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oPC));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oHenchman));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oFamiliar));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oAnimalCompanion));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oTourEnd);

    //Play magic forest sound (won't get played on the StartingLocation)
    PlaySound("as_mg_frstmagic4");
    AssignCommand(oTourEnd, PlaySound("as_mg_frstmagic4"));

    //Teleport the player and any associates back to her home.
    AssignCommand(oPC, ActionJumpToObject(oTourEnd));
    AssignCommand(oHenchman, ActionJumpToObject(oTourEnd));
    AssignCommand(oFamiliar, ActionJumpToObject(oTourEnd));
    AssignCommand(oAnimalCompanion, ActionJumpToObject(oTourEnd));
}
