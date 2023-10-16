//::///////////////////////////////////////////////
//:: M4_INITEND.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Checks to see if the player has initiated dialogue yet.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
//    if (GetLocalInt(GetPCSpeaker(),"NW_L_Init_" + GetTag(OBJECT_SELF),TRUE);
    return !GetIsObjectValid(GetPCSpeaker());
}
