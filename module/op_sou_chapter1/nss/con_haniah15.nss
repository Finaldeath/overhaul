//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Refugees have been rescued and if she
     said this line before.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int roll=d100();
    if (GetLocalInt(GetModule(),"q3_Blumberg_Refugees")==1
        && GetLocalInt(GetPCSpeaker(),"X1_HANAIAHCONGRATS")==0)
        return TRUE;
    return FALSE;
}
