//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #6
//:: lordiridor_06
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if Lord Iridor has already said
    his text bubble and his initial conversation.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iIridorTalked = GetLocalInt(OBJECT_SELF, "IridorTalked");

    if (iIridorTalked == 2)
    {
        return TRUE;
    }
    return FALSE;
}


