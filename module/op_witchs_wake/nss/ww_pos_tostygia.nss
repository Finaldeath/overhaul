//::///////////////////////////////////////////////
//:: Witchwork: Descend to Stygia
//:: WW_PoS_ToStygia.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player and any associates (except
     henchmen) descend to Stygia.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oStygia = GetObjectByTag("WP_StygiaSpawn");
    effect eVFX = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);

    //Apply smoke puff visuals
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oPC));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oFamiliar));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oAnimalCompanion));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oStygia);

    //Play magic forest sound (won't get played on the StartingLocation)
    PlaySound("as_mg_frstmagic4");
    AssignCommand(oStygia, PlaySound("as_mg_frstmagic4"));

    //Teleport the player and any associates to the pits of Stygia
    AssignCommand(oPC, ActionJumpToObject(oStygia));
    AssignCommand(oFamiliar, ActionJumpToObject(oStygia));
    AssignCommand(oAnimalCompanion, ActionJumpToObject(oStygia));
}
