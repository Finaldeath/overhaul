//::///////////////////////////////////////////////
//:: Pen & Ink Condition
//:: C_Pen_And_Ink.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has the pen and
     ink.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bPen = GetIsPC(GetItemPossessor(GetObjectByTag("Library_Pen")));
    int bInk = GetIsPC(GetItemPossessor(GetObjectByTag("Library_Inkwell")));
    int bRewritten = GetLocalInt(OBJECT_SELF, "bRewritten");

    if (bPen == TRUE &&
        bInk == TRUE &&
        bRewritten == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
