// Belladona root in the urn

int StartingConditional()
{
   if(GetTag(OBJECT_SELF) == "Q3B_RIGHT_URN" && GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC23") != OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
