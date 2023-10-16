// Check for regular wolf.
int StartingConditional()
{
    if(GetTag(OBJECT_SELF) == "hx_winter_wolf_p")
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
