//::///////////////////////////////////////////////
//:: Spirit of the Dead, The Scrivener (Action Script)
//:: H2c_Ghost_Scriv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the PC as knowing about the Scrivener.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bScrivener", TRUE);
}
