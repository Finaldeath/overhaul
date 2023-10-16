//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      Check that PC hasn't tried this already.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On:March 5, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC,"X1_RUMGUTDRINK")==0 && GetLocalInt(OBJECT_SELF, "nRumgutGiveUp") != 1)
        return TRUE;
    return FALSE;
}
