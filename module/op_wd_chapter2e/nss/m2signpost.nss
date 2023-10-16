//::///////////////////////////////////////////////
//:: Name
//:: M2Signpost
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script displays a string when the object
    is used.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oUsed = GetLastUsedBy();

    if (GetIsPC(oUsed))
    {
        SpeakOneLinerConversation();
    }
}
