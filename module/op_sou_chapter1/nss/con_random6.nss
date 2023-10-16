//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Do a random check, one in six chance of this
     line appearing.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int roll=d100();
        if (roll<18)
        return TRUE;
    return FALSE;
}
