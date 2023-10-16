//::///////////////////////////////////////////////
//:: dahannatalk0
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if player has talked to Dahanna yet
*/
//:://////////////////////////////////////////////
//:: Created By:   Drew Karpyshyn
//:: Created On:    August 7,2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL")==0;
    return iResult;
}
