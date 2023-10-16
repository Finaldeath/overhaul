//::///////////////////////////////////////////////
//:: Gatekeeper, Githzerai Pilgrims Allowed Home (Action Script)
//:: H1a_Gate_Pilgrim.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having commanded the
     Gatekeeper to let the Pilgrims return home
     to Limbo.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

void main()
{
    //Set a local on the Module
    SetLocalInt(GetModule(), "bGatekeeper_PilgrimHome", TRUE);
}
