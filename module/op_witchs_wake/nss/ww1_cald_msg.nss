//::///////////////////////////////////////////////
//:: Witch's Wake: Caldrian, "She" Message
//:: WW1_Cald_Msg.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Save out the fact that the player has told
     Caldrian the nature of Prince Ahmed's message
     ("Tell the King that she is dead...")
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: January 13, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_CALD_SheMessage", TRUE);
}
