//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC is on Thaymart quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_THAYQUEST") == 1
        &&GetLocalInt(GetModule(),"SZARENHELP")<30)
        return TRUE;
    return FALSE;
}
