//::///////////////////////////////////////////////
//:: Witchwork: Ethereal Leak Action
//:: WW_EtherealLeakA.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags this ethereal leak as the destination
     for any post-death respawns or late-joiner
     teleportations.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_LEAK_Touched", TRUE);

    //Only activate this leak if the Mines leak has not yet been activated.
    int bMinesLeakActivated = GetLocalInt(GetModule(), "bMinesLeakActivated");
    if (bMinesLeakActivated == FALSE)
    {
        SetLocalObject(GetModule(), "oEtherealLeak", OBJECT_SELF);
    }

    //Flag it as used regardless.
    SetLocalInt(OBJECT_SELF, "bUsed", TRUE);
}
