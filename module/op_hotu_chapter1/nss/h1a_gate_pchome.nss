//::///////////////////////////////////////////////
//:: Gatekeeper, PC Going Home (Action Script)
//:: H1a_Gate_PCHome.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having commanded the
     Gatekeeper by his True Name and summons in
     a door that will lead them home to Waterdeep.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

void CreateDoor(location lTarget, object oPC);

void main()
{
    //Set a local on the Module
    SetLocalInt(GetModule(), "bGatekeeper_PlayerHome", TRUE);

    //Handle the VFX
    object oDoorSpawn = GetObjectByTag("WP_ToWaterdeep");
    location lDoorSpawn = GetLocation(oDoorSpawn);
    ActionCastFakeSpellAtLocation(SPELL_ISAACS_LESSER_MISSILE_STORM, lDoorSpawn);
    effect eVFX = EffectVisualEffect(471);
    DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lDoorSpawn));

    //Spawn in the door.
    object oPC = GetPCSpeaker();
    DelayCommand(3.0, CreateDoor(lDoorSpawn, oPC));
}

void CreateDoor(location lTarget, object oPC)
{
    //Spawn in the door.
    object oNewDoor = CreateObject(OBJECT_TYPE_PLACEABLE, "x2_homedoor", lTarget);

    //Make it glow
    effect eGlow = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, oNewDoor);

    //Have it launch conversationwith the player.
    DelayCommand(1.0, AssignCommand(oNewDoor, ActionStartConversation(oPC)));
}

