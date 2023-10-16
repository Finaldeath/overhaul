//::///////////////////////////////////////////////
//:: Mephistopheles, Nathyrra's Betrayal (Action Script)
//:: H9a_Meph_Betray2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag Nathyrra as having betrayed the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bNathyrraBetrays", TRUE);

    //Nix the romance
    int iRomance = GetLocalInt(GetModule(), "iNathyrraRomance");
    if (iRomance != 3)
    {
        SetLocalInt(GetModule(), "iNathyrraRomance", 0);
    }
}
