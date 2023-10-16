//::///////////////////////////////////////////////
//:: Lazy the Imp, PC has Figured Out the Problem w Grinder 5 (Action Script)
//:: H2a_Lazy_Problem.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as having figured out the
     problem with Quarry Grinder 5.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bLazyTalked", TRUE);
}
