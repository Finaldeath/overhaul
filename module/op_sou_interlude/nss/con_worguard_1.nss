//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has spoken to the guard and knows
     about the other outsider.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 8, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"X1_AOGUARDSPOKE")==0)
        return TRUE;
    return FALSE;
}
