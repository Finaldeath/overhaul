//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Player Confesses to Dismantling Grinder (Action Script)
//:: H2a_Gruul_Disman.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player admits to Gru'ul that he dismantled
     the grinder.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 29, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bPlayerAdmitsDismantlingGrinder", TRUE);
}
