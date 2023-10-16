//::///////////////////////////////////////////////
//:: Mephistopheles, Deekin's Betrayal (Action Script)
//:: H9a_Meph_Betray4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag Deekin as having betrayed the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bDeekinBetrays", TRUE);
}
