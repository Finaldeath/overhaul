// Check for wolf pup.
int StartingConditional()
{
    if(GetTag(OBJECT_SELF) == "hx_winter_wolf_p" && GetLocalInt(GetModule(), "HX_WOLF_QUEST") == 3)
    {
        if(GetTag(GetArea(OBJECT_SELF)) != "TheWastelands")
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    else
    {
        return FALSE;
    }
}
