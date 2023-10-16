//::///////////////////////////////////////////////
//:: Pen & Ink Condition (Three Winds)
//:: C_Pen_Ink_Winds.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has the pen and
     ink and has learned of the Three Winds.
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
    object oPC = GetPCSpeaker();
    int bWinds = GetLocalInt(oPC, "bThreeWinds");

    if (bPen == TRUE &&
        bInk == TRUE &&
        bRewritten == FALSE &&
        bWinds == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
