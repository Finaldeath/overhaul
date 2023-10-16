//::///////////////////////////////////////////////
//:: Mephistopheles, Valen's Betrayal (Action Script)
//:: H9a_Meph_Valen2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag Valen as having betrayed the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bValenBetrays", TRUE);

    //Nix the romance
    int iRomance = GetLocalInt(GetModule(), "iValenRomance");
    if (iRomance != 3)
    {
        SetLocalInt(GetModule(), "iValenRomance", 0);
    }
}
