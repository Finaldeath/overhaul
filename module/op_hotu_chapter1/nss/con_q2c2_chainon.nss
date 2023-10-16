//::///////////////////////////////////////////////
//:: Name con_q2c2_chainon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If the Chain on this pedastal has already been
     placed, then don't show this route of the conversation.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 6/02
//:://////////////////////////////////////////////


int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nChainOn") == 1)
        return FALSE;
    return TRUE;
}
