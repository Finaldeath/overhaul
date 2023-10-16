//::///////////////////////////////////////////////
//:: M3Q3D_DEMON3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Demon has been given less than 2 potions.
    On the third (the other starting condition)
    he will attack the player
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_NUMBERPOTIONS") < 2;
    return iResult;
}
