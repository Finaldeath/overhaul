//::///////////////////////////////////////////////
//:: Sleeping Man Requested Proof (Action Script)
//:: H3a_SMan_Proof.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The Sleeping Man has requested proof of the
     identity of his one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

void main()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    SetLocalInt(oMan, "bProofRequested", TRUE);
}
