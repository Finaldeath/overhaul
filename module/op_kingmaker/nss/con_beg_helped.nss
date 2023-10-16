//::///////////////////////////////////////////////
//:: Beggar helped
//:: con_beg_helped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The beggar has been helped in some way by the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "OS_BEGGAR_FISH") > 0;
    return iResult;
}
