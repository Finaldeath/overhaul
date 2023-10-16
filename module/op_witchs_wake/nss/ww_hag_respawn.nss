//::///////////////////////////////////////////////
//:: Witchwork: Night Hag Respawns the Player
//:: WW_Hag_Respawn.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The Night Hag returns the player and any
     associates to the Land of the Living via the
     most recently activated Ethereal Link.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oEtherealLeak = GetLocalObject(GetModule(), "oEtherealLeak");
    location lEtherealLeak = GetLocation(oEtherealLeak);
    effect eVFX = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
/*DEBUG*/// string sTag = GetTag(oEtherealLeak);

    //If no Ethereal Leak has been activated, use the module's Starting Location
    if (oEtherealLeak == OBJECT_INVALID)
    {
        lEtherealLeak = GetStartingLocation();
/*DEBUG*/// sTag = "StartingLocation";
    }

    //Apply smoke puff visuals
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oPC));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oHenchman));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oFamiliar));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, GetLocation(oAnimalCompanion));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lEtherealLeak);

    //Play magic forest sound (won't get played on the StartingLocation)
    PlaySound("as_mg_frstmagic4");
    AssignCommand(oEtherealLeak, PlaySound("as_mg_frstmagic4"));

    //Teleport the player and any associates
    DelayCommand(1.0, AssignCommand(oPC, ActionJumpToLocation(lEtherealLeak)));
    DelayCommand(1.0, AssignCommand(oHenchman, ActionJumpToLocation(lEtherealLeak)));
    DelayCommand(1.0, AssignCommand(oFamiliar, ActionJumpToLocation(lEtherealLeak)));
    DelayCommand(1.0, AssignCommand(oAnimalCompanion, ActionJumpToLocation(lEtherealLeak)));

/*DEBUG*/// SpeakString(sTag, TALKVOLUME_SHOUT);
}
