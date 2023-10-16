//::///////////////////////////////////////////////
//:: Mephistopheles, Player Chooses Stop (Action Script)
//:: H9a_Meph_Stop.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as having chosen to Stop
     Mephistopheles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalString(GetModule(), "sPCEndChoice", "Stop");
}
