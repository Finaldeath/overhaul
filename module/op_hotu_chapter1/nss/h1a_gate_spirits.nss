//::///////////////////////////////////////////////
//:: Gatekeeper, Spirits of the Dead Allowed to Haunt (Action Script)
//:: H1a_Gate_Spirits.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having commanded the
     Gatekeeper to let the Spirits of the Dead
     haunt the Land of the Living.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

void main()
{
    //Set a local on the Module
    SetLocalInt(GetModule(), "bGatekeeper_SpiritHome", TRUE);
}
