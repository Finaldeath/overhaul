//::///////////////////////////////////////////////
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Check to see if the PC has SPELL_PREMONITION
  memorized...
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: June 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "STORED_SPELL" + IntToString(SPELL_PREMONITION)) == 1)
        return FALSE;
    if (GetHasSpell(
       SPELL_PREMONITION
      , GetPCSpeaker()) > 0)

        {
            return TRUE;
        }
    object oScroll = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_SPARSCR808");
    if(oScroll != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
