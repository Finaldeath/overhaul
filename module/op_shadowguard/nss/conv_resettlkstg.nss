// Used at the beginning of each conversation node for
// conversation node control
// Used in "Text Appears When.." field to set it at
// the beginning of the conversation
// Should NEVER return TRUE

int StartingConditional()
{
    SetLocalInt(OBJECT_SELF, "N_TALK_SWITCH", 0);

    return FALSE;
}
