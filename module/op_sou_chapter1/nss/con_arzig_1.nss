//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC is neutral to Chief.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 20, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"X1_Q5CHAMPION")==10)
        return TRUE;
    return FALSE;
}
