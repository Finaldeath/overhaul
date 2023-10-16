//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If PC freed Becka.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 28, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_Q1RuralRebFree")==99||GetLocalInt(GetModule(), "X1_Q1RuralRebFree")==70)
        return TRUE;
    return FALSE;
}
