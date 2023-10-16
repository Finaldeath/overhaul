//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Rumor: The Lottery (Action Script)
//:: Q3a_Rumor_Lotter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having learned that the
     villagers hold some form of Lottery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "Q3_Rumor_Lottery", TRUE);
}
