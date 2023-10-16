//::///////////////////////////////////////////////
//:: Talias Conversation Script #1
//:: Talias01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if Talias hasn't spoken to anyone
    previously.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iTaliasTalked = GetLocalInt(OBJECT_SELF, "TaliasTalked");

    if (iTaliasTalked == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
