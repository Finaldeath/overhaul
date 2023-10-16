//::///////////////////////////////////////////////
//:: Talias Conversation Script #2
//:: Talias02
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

    if (iTaliasTalked == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

