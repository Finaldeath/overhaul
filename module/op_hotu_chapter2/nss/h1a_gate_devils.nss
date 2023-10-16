//::///////////////////////////////////////////////
//:: Gatekeeper, Devils Allowed to Swarm the Planes (Action Script)
//:: H1a_Gate_Devils.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having commanded the
     Gatekeeper to let the Devils swarm across
     the Planes.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

void main()
{
    //Set a local on the Module
    SetLocalInt(GetModule(), "bGatekeeper_DevilHome", TRUE);
}
