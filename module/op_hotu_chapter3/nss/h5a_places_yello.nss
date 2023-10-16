//::///////////////////////////////////////////////
//:: Knower of Places, Yellow Lighting Change (Action Script)
//:: H5a_Places_Yello.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Transitions to the Yellow lighting scheme &
     spawns in the exit door.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 2, 2003
//:://////////////////////////////////////////////

void main()
{
    //Set the variable
    SetLocalInt(OBJECT_SELF, "bRingSwap", TRUE);

    //Change the lighting scheme.
    object oPC = GetPCSpeaker();
    DayToNight(oPC, 5.0);

    //Spawn in the new door.
    object oWP = GetObjectByTag("hx_portal_2_greater_wp");
    location lLoc = GetLocation(oWP);
    object oDoor = GetObjectByTag("hx_ring_2_greater");
    if(!GetIsObjectValid(oDoor))
    {
        CreateObject(OBJECT_TYPE_PLACEABLE, "hx_ring_2_sle001", lLoc);
    }

    //Apply some VFX to make the spawning of the door more obvious.
    effect eVFX = EffectVisualEffect(VFX_IMP_HEALING_X);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lLoc);

    //Reposition the player's camera to make it even *more* obvious.
    AssignCommand(oPC, SetCameraFacing(90.0));
}
