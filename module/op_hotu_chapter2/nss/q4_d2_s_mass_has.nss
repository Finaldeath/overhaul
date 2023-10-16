//::///////////////////////////////////////////////
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Check to see if the PC has SPELL_MASS_HASTE
  memorized...
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: June 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "STORED_SPELL" + IntToString(SPELL_MASS_HASTE)) == 1)
        return FALSE;
    if (GetHasSpell(
       SPELL_MASS_HASTE
      , GetPCSpeaker()) > 0)

        {
            return TRUE;
        }
    object oScroll = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_SPARSCR611");
    if(oScroll != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
