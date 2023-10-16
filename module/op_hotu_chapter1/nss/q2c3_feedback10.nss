//::///////////////////////////////////////////////
//:: q2c3_feedback10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Return true if Feedback, message #10 should be
  displayed.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 5/02
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "NW_L_FEEDBACK") == 10;
    return iResult;
}


