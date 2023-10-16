//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q5CSLEAH001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Leah before being rescued
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 25, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 0 &&
                !GetIsObjectValid(GetPCSpeaker());

    return l_iResult;
}
