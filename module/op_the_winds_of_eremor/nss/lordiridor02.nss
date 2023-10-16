//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #2
//:: lordiridor_02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if Lord Iridor has already said
    his text bubble.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iIridorTalked = GetLocalInt(OBJECT_SELF, "IridorTalked");

    if (iIridorTalked == 1)
    {
        return TRUE;
    }
    return FALSE;
}

