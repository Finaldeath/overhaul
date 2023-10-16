//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Rumor: Priests Are Scary (Action Script)
//:: Q3a_Rumor_Priest.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having learned that the
     villagers are scared of the priests.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "Q3_Rumor_Priests", TRUE);
}
