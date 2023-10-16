//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Refugees have been rescued. 50% chance of
     dropping to next line.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int roll=d100();
    if (GetLocalInt(GetModule(),"q3_Blumberg_Refugees")==1
        && roll<50)
        return TRUE;
    return FALSE;
}
