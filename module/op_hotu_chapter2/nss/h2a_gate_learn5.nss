//::///////////////////////////////////////////////
//:: The Gatekeeper, 5th-Fold Mystery Learned (Action Script)
//:: H2a_Gate_Learn5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the fact that the player has learned
     the 5th-fold mystery of the Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bMystery5Learned", TRUE);
}
