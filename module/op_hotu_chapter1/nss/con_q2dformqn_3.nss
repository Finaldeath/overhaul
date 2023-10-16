//Return True if the Formian Queen has not been freed yet
int StartingConditional()
{
    if (!GetLocalInt(OBJECT_SELF, "can_talk"))
        return TRUE;
    return FALSE;
}
