//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC tried to rob him.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On:Feb 25, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"X1_HOUSEGUYROBBED")==10;
    return iResult;
}

