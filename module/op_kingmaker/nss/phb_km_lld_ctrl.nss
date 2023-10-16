//::///////////////////////////////////////////////
//:: Heartbeat For the Bouncing Puzzle
//:: phb_km_lld_ctrl
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This include file is for the Heartbeat calls on
    the bouncing puzzle in the Bastion of the Enemy
    final dungeon
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

#include "inc_km_lld_pzzl"

void main()
{
    object oSource = GetObjectByTag("rotate_bracket_a");
    object oController = GetObjectByTag("km_finalcontroller");
    int iState = GetLocalInt(oController, "PUZ_STATE");


    if (iState >= PUZ_TUNREDON)
    {
        // the machine is on
        AssignCommand(oSource, LaunchProjectile(oSource, 90, 10));
    }
    else
    {
        //The machine should be off.
        SetLocalInt(oController, "PUZ_STATE", PUZ_TUNREDOFF);
    }
}
