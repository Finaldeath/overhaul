//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if ambient saying line has already
     spoken, move to next line.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"os_ambient_cycle")==10)
        return TRUE;
    return FALSE;
}

