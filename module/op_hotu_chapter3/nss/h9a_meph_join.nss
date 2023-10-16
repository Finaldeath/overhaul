//::///////////////////////////////////////////////
//:: Mephistopheles, Player Chooses Join (Action Script)
//:: H9a_Meph_Join.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as having chosen to Join
     Mephistopheles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalString(GetModule(), "sPCEndChoice", "Join");
}
