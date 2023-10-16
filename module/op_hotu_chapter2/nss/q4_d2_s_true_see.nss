//::///////////////////////////////////////////////
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Check to see if the PC has SPELL_TRUE_SEEING
  memorized...
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: June 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "STORED_SPELL" + IntToString(SPELL_TRUE_SEEING)) == 1)
        return FALSE;
    if (GetHasSpell(
       SPELL_TRUE_SEEING
      , GetPCSpeaker()) > 0)
        {
            return TRUE;
        }
    object oScroll = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_SPARSCR606");
    if(oScroll != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
