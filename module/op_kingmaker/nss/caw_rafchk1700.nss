//::///////////////////////////////////////////////
//:: caw_rafchk1700
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check that the Agreed price is now 1700 coins
     for Rafaels vote.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Aug 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "BRIBE_1700");

    return iResult;
}
