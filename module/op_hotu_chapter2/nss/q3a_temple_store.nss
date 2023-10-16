//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Knowledge: Temple Store (Action Script)
//:: Q3a_Temple_Store.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having learned that the
     Temple Guards offer a store.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "Q3_Rumor_TempleStore", TRUE);
}
