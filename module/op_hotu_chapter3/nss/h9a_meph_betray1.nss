//::///////////////////////////////////////////////
//:: Mephistopheles, Aribeth's Betrayal (Action Script)
//:: H9a_Meph_Betray1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag Aribeth as having betrayed the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bAribethBetrays", TRUE);

    //Nix the romance
    int iRomance = GetLocalInt(GetModule(), "iAribethRomance");
    if (iRomance != 3)
    {
        SetLocalInt(GetModule(), "iAribethRomance", 0);
    }
}
