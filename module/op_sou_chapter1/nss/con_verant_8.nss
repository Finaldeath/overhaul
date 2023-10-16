//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC is on Thaymart quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 20, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_THAYQUEST") == 2
        &&GetLocalInt(GetModule(),"SZARENHELP")<30)
        return TRUE;
    return FALSE;
}
