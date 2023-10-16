//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #1
//:: lordiridor_01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if Lord Iridor has not yet said
    his text bubble.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iIridorTalked = GetLocalInt(OBJECT_SELF, "IridorTalked");

    if (iIridorTalked == 0)
    {
        return TRUE;
    }
    return FALSE;
}
