//::///////////////////////////////////////////////
//:: Name q4a_ox_check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks to see which ox the conversation is on
     so that it can give a different one to the
     quest ox, Bessy.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    if(GetTag(OBJECT_SELF) == "q4a_ox")
       iResult = TRUE;
    return iResult;
}
