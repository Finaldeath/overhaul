//::///////////////////////////////////////////////
//:: Leah while being rescued
//:: M2Q5CSFARMPLOT08
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Leah while being rescued
*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: Jan. 22, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int l_iResult;

    l_iResult =

    GetLocalInt(OBJECT_SELF, " NW_L_Rescued") == 10;

    return l_iResult;
}
