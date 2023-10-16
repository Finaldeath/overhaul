//::///////////////////////////////////////////////
//:: Opens the Portal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Gives player a White Portal Key so they
   can use the portal in Eltoora's Lab
*/
//:://////////////////////////////////////////////
//:: Created By:     Brent
//:: Created On:     November 2001
//:://////////////////////////////////////////////


void main()
{
    TakeGoldFromCreature(2000, GetPCSpeaker(), TRUE);
    CreateItemOnObject("M3Q1A09WHITEPOR", GetPCSpeaker());
}
