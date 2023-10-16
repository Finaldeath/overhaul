//::///////////////////////////////////////////////
//:: Witch's Wake 1: Mine Cinematic, Script #3
//:: WW1_MineCine_3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Remove the black screen on a conversation
     node.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: February 10, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    FadeFromBlack(oPC, FADE_SPEED_SLOWEST);
}
