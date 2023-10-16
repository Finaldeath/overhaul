//::///////////////////////////////////////////////
//:: The Knower of Names, Gru'ul Talked To (Condition Script)
//:: H7c_Name_Gruul_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Gru'ul has been talked to.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oGruul = GetObjectByTag("h2_devil_gruul");
    int bGruul = GetLocalInt(oGruul, "bPre-QuestTalked");
    int bTrueName = GetLocalInt(GetModule(), "bKnower_GruulNamed");
    if (bGruul == TRUE &&
        bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}

